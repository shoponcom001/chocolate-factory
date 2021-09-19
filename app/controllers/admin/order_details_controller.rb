class Admin::OrderDetailsController < Admin::AdminsController

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    @order = @item.order
    @item = @order.item
    if @item.production_status == "during_production"
      @order.order_status = "in_production"
      @order.save
      ContactMailer.production_mail(@order).deliver
    elsif @item.production_status == "production_completed"
      @order.order_status = "preparing_delivery"
      @order.save
    end
    redirect_to request.referer
  end

  private

  def item_params
    params.require(:item).permit(:production_status)
  end

end
