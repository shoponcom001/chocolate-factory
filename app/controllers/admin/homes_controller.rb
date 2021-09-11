class Admin::HomesController < Admin::AdminsController
  def top
  end

  def set_due_date_period
    @due_date_period = DueDatePeriod(params[:id])
  end

end
