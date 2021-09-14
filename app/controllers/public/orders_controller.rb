class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    #session[:item_id] = params[:item_id]
    #session[:design_id] = params[:design_id]
    @order = Order.new(order_params)
    @order.user = current_user
    @item = Item.find(session[:item_id])
    @order.price = @item.buy_price
    period = Period.find(@item.period.id)
    @order.due_date = @item.created_at + period.day
    @order.save!
    session[:item_id] = nil

    redirect_to orders_confirm_path
  end

  def complete
  end

  def create
    @order = Order.new
    @order.save
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :phone_number, :payment_method, :price, :due_date)
  end

end
