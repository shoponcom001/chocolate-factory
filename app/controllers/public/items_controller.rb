class Public::ItemsController < ApplicationController
  def show
    @item = Item.new
    @design = Design.find(params[:id])
    @period = Period.find_by(span: params[:span])
  end
end
