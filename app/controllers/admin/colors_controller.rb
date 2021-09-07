class Admin::ColorsController < ApplicationController

  def index
    @colors = Color.all
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new(color_params)
    if @color.save
      redirect_to admin_colors_path
    else
      redirect_to request.referer
    end
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    color = Color.find(params[:id])
    if color.update(color_params)
      redirect_to admin_colors_path
    else
      redirect_to request.referer
    end
  end

  def destroy
    color = Color.find(params[:id])
    color.destroy
    redirect_to admin_colors_path
  end

  private

  def color_params
    params.require(:color).permit(:name)
  end

end
