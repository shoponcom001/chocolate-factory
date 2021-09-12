class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def comfirm
  end

  def complete
  end

  def create
    @order = Order.new
    @order.save
    redirect_to orders_confirm_path
  end

  def index
  end

  def show
  end
end
