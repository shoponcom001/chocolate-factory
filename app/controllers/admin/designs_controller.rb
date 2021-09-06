class Admin::DesignsController < ApplicationController

  def index
    @designs = Design.all
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)
    if @design.save
      redirect_to admin_designs_path
    else
      render :new
    end
  end


  def show
    @design = Design.find(params[:id])
  end

  def edit
    @design = Design.find(params[:id])
  end

  def update
    @design = Design.find(params[:id])
    if @design.update(design_params)
      redirect_to admin_design_path(@design)
    else
      render :edit
    end
  end

  private

  def design_params
    params.require(:design).permit(:name, :price, :image, :is_ordered)
  end

end
