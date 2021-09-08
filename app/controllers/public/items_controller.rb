class Public::ItemsController < ApplicationController
  def show
    @item = Item.new
    @design = Design.find(params[:id])
  end
end
