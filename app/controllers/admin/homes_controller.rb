class Admin::HomesController < Admin::AdminsController

  def top
    @orders = Order.all.page(params[:page]).reverse_order
  end

end
