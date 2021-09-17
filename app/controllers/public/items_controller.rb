class Public::ItemsController < ApplicationController

  def show
    @item = Item.new
    @design = Design.find(params[:id])
    @period = Period.last
  end

  def create
    @item = Item.new(item_params)
    if
      :rank_id.blank? || :color_id.blank? || :last_id.blank?
      redirect_to request.referer
      flash[:alert] = "必要項目を選択してください"
    end
      rank = Rank.find(params[:rank_id])
      color = Color.find(params[:color_id])
      last = Last.find(params[:last_id])
      design = Design.find(params[:item][:design_id])
      @item.buy_name = rank.name + color.name + last.name
      @item.buy_price = rank.price + design.price
      if @item.material == "buy"
        @item.buy_price += 2000
      end
    if @item.save
      session[:item_id] = @item.id
      redirect_to new_order_path
    else
      redirect_to request.referer
      flash[:alert] = "必要項目を選択してください"
    end
  end

  private

  def item_params
    params.require(:item).permit(:buy_name, :material, :size, :buy_price, :design_id, :period_id)
  end

end
