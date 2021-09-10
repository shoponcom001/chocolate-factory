class Admin::PeriodsController < ApplicationController
  
  def new
    @period = Period.new
  end
  
  def create
    @period = Period.new(period_params)
    if @period.save
      redirect_to admin_root_path
    else
      redirect_to request.referer
    end
  end
  
  def edit
    @period = Period.find(params[:id])
  end
  
  def update
    period = Period.find(params[:id])
    if period.update(period_params)
      redirect_to admin_root_path
    else
      redirect_to request.referer
    end
  end
  
  private
  
  def period_params
    params.require(:period).permit(:day, :span)
  end
  
end
