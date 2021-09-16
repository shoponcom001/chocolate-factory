class Public::OrdersController < ApplicationController

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
    # session[:order_id] = @order.id
    @order.save
    # session[:item_id] = nil
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.save
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
    @items = Item.all
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :phone_number, :payment_method, :price, :due_date)
  end

end
