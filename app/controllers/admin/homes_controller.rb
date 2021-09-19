class Admin::HomesController < Admin::AdminsController

  def top
    @orders = Order.all.order(created_at: :desc)
  end

end
