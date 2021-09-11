class Public::ItemsController < ApplicationController

  def show
    @design = Design.find(params[:id])
    @period = Period.last
  end

  def create
    @design = Design.find(params[:id])
    @item = @design.item.new
    @item.save
    redirect_to root_path
  end

end
