class Admin::RanksController < ApplicationController

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
    else
      redirect_to request.referer
    end
  end

  def edit
    @rank = Rank.find(params[:id])
  end

  def update
    rank = Rank.find(params[:id])
    if rank.update(rank_params)
      redirect_to admin_ranks_path
    else
      redirect_to request.referer
    end
  end

  def destroy
    rank = Rank.find(params[:id])
    rank.destroy
    redirect_to admin_ranks_path
  end

  def rank_params
    params.require(:rank).permit(:name, :price)
  end

end
