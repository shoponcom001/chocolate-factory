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
      flash[:notice] = "新規登録しました。"
    else
      redirect_to request.referer
      flash[:alert] = "必要項目を入力してください"
    end
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    color = Color.find(params[:id])
    if color.update(color_params)
      redirect_to admin_colors_path
      flash[:notice] = "変更しました。"
    else
      redirect_to request.referer
      flash[:alert] = "必要項目を入力してください"
    end
  end

  def destroy
    color = Color.find(params[:id])
    color.destroy
    redirect_to admin_colors_path
    flash[:alert] = "削除しました。"
  end

  private

  def color_params
    params.require(:color).permit(:name)
  end

end
