class Admin::LastsController < ApplicationController

  def index
    @lasts = Last.all
  end

  def new
    @last = Last.new
  end

  def create
    @last = Last.new(last_params)
    if @last.save
      redirect_to admin_lasts_path
      flash[:notice] = "新規登録しました。"
    else
      redirect_to request.referer
      flash[:error] = "必要項目を入力してください"
    end

  end

  def edit
    @last = Last.find(params[:id])
  end

  def update
    last = Last.find(params[:id])
    if last.update(last_params)
      redirect_to admin_lasts_path
      flash[:notice] = "変更しました。"
    else
      redirect_to request.referer
      flash[:error] = "必要項目を入力してください"
    end
  end

  def destroy
    last = Last.find(params[:id])
    last.destroy
    redirect_to admin_lasts_path
    flash[:notice] = "削除しました。"
  end

  private

  def last_params
    params.require(:last).permit(:name)
  end

end
