class Admin::HomesController < ApplicationController
  def top
  end

  def set_due_date_period
    @due_date_period = DueDatePeriod(params[:id])
  end

end
