class Admin::OrdersController < Admin::AdminsController

  def show
    @order = Order.find(params[:id])
    @item = @order.item
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "delivered"
      ContactMailer.completed_mail(@order).deliver
    end
    redirect_to request.referer

  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
