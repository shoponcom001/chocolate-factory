class Admin::LastsController < Admin::AdminsController

  def index
    @lasts = Last.all
  end

  def new
    @last = Last.new
  end

  def create
    @last = Last.new(last_params)
    if @last.save
      flash[:notice] = "新規登録しました。"
      redirect_to admin_lasts_path
    else
      flash[:alert] = "必要項目を入力してください"
      redirect_to request.referer
    end

  end

  def edit
    @last = Last.find(params[:id])
  end

  def update
    last = Last.find(params[:id])
    if last.update(last_params)
      flash[:notice] = "変更しました。"
      redirect_to admin_lasts_path
    else
      flash[:alert] = "必要項目を入力してください"
      redirect_to request.referer
    end
  end

  def destroy
    last = Last.find(params[:id])
    last.destroy
    flash[:alert] = "削除しました。"
    redirect_to admin_lasts_path
  end

  private

  def last_params
    params.require(:last).permit(:name)
  end

end
