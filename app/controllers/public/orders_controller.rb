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
      redirect_to request.referer
      flash[:alert] = "必要項目を選択してください"
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.save
    @item = Item.find(session[:item_id])
    @item = Item.create(
      order_id: @order.id,
      design_id: @item.design_id,
      period_id: @item.period_id,
      buy_name: @item.buy_name,
      material: @item.material,
      size: @item.size,
      buy_price: @item.buy_price
      )
    render :complete
  end

  def index
    @orders = Order.where(user_id: current_user.id)
    @items = Item.where(order_id: params[:id])
    # byebug
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :phone_number, :payment_method, :price, :due_date)
  end

end
