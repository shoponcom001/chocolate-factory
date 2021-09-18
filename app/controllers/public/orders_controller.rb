class Public::OrdersController < ApplicationController
  before_action :authenticate_user!
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.user = current_user
    @item = Item.find(session[:item_id])
    @design = @item.design
    @size = Size.find(@item.size)
    @order.price = @item.buy_price
    @period = Period.last
    @order.due_date = @item.created_at + @period.day.days
    if
      @order.postal_code.empty? || @order.address.empty? || @order.name.empty? || @order.phone_number.empty?
      flash[:alert] = "必要項目を選択してください"
      redirect_to request.referer
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.save
    @item = Item.find(session[:item_id])
    @item.order_id = @order.id
    @item.save
    # ContactMailer.send_mail(current_user, @order, @design, @item).deliver
    render :complete
  end

  def index
    @orders = Order.where(user_id: current_user.id)
    @items = Item.where(order_id: params[:id])
  end

  def show
    @order = Order.find(params[:id])
    @size = Size.find(@order.item.size)
  end

  def pay
    @order = Order.new(order_params)
    @order.user = current_user
    @order.save
    @item = Item.find(session[:item_id])
    @item.order_id = @order.id
    @item.save
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
      :amount => @order.price,
      :card => params['payjp-token'],
      :currency => 'jpy'
    )
    # ContactMailer.send_mail(current_user, @order, @design, @item).deliver
    render :complete
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :phone_number, :payment_method, :price, :due_date)
  end

end
