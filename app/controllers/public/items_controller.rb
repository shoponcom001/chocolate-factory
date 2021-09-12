class Public::ItemsController < ApplicationController

  def show
    @item = Item.new
    @design = Design.find(params[:id])
    @period = Period.last
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to new_order_path
  end

  private

  def item_params
    params.require(:item).permit(:buy_name, :material, :size, :buy_price)
  end

end
