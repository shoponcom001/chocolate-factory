class Admin::PeriodsController < Admin::AdminsController
  
  def new
    @period = Period.new
  end
  
  def create
    @period = Period.new(period_params)
    if @period.save
      redirect_to admin_root_path
      flash[:notice] = "納期を登録しました"
    else
      redirect_to request.referer
      flash[:alert] = "必要項目を入力してください"
    end
  end

  private
  
  def period_params
    params.require(:period).permit(:day, :span)
  end
  
end
