class Admin::RanksController < Admin::AdminsController

  def index
    @ranks = Rank.all
  end

  def new
    @rank = Rank.new
  end

  def create
    @rank = Rank.new(rank_params)
    if @rank.save
      redirect_to admin_ranks_path
      flash[:notice] = "新規登録しました。"
    else
      redirect_to request.referer
      flash[:alert] = "必要項目を入力してください"
    end
  end

  def edit
    @rank = Rank.find(params[:id])
  end

  def update
    rank = Rank.find(params[:id])
    if rank.update(rank_params)
      redirect_to admin_ranks_path
      flash[:notice] = "変更しました。"
    else
      redirect_to request.referer
      flash[:alert] = "必要項目を入力してください"
    end
  end

  def destroy
    rank = Rank.find(params[:id])
    rank.destroy
    redirect_to admin_ranks_path
    flash[:alert] = "削除しました。"
  end

  def rank_params
    params.require(:rank).permit(:name, :price)
  end

end
