class Admin::PeriodsController < Admin::AdminsController
  
  def new
    @period = Period.new
  end
  
  def create
    @period = Period.new(period_params)
    if @period.save
      flash[:notice] = "納期を登録しました"
      redirect_to admin_root_path
    else
      flash[:alert] = "必要項目を入力してください"
      redirect_to request.referer
    end
  end

  private
  
  def period_params
    params.require(:period).permit(:day, :span)
  end
  
end
