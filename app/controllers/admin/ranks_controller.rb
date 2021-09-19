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
      flash[:notice] = "新規登録しました。"
      redirect_to admin_ranks_path
    else
      flash[:alert] = "必要項目を入力してください"
      redirect_to request.referer
    end
  end

  def edit
    @rank = Rank.find(params[:id])
  end

  def update
    rank = Rank.find(params[:id])
    if rank.update(rank_params)
      flash[:notice] = "変更しました。"
      redirect_to admin_ranks_path
    else
      flash[:alert] = "必要項目を入力してください"
      redirect_to request.referer
    end
  end

  def destroy
    rank = Rank.find(params[:id])
    rank.destroy
    flash[:alert] = "削除しました。"
    redirect_to admin_ranks_path
  end

  def rank_params
    params.require(:rank).permit(:name, :price)
  end

end
