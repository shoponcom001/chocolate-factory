class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def comfirm
  end

  def complete
  end

  def create
    @order = current.user.order.new(order_params)
    @order.save
    redirect_to orders_confirm_path
  end

  def index
  end

  def show
  end
end
