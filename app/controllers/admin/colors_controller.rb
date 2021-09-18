class Admin::ColorsController < Admin::AdminsController

  def index
    @colors = Color.all
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new(color_params)
    if @color.save
      flash[:notice] = "新規登録しました。"
      redirect_to admin_colors_path
    else
      flash[:alert] = "必要項目を入力してください"
      redirect_to request.referer
    end
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    color = Color.find(params[:id])
    if color.update(color_params)
      flash[:notice] = "変更しました。"
      redirect_to admin_colors_path
    else
      flash[:alert] = "必要項目を入力してください"
      redirect_to request.referer
    end
  end

  def destroy
    color = Color.find(params[:id])
    color.destroy
    flash[:alert] = "削除しました。"
    redirect_to admin_colors_path
  end
  
  def set_due_date_period
    @due_date_period = DueDatePeriod(params[:id])
  end

  private

  def color_params
    params.require(:color).permit(:name)
  end

end
