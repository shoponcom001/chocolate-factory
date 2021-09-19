class Admin::DesignsController < Admin::AdminsController
  

  def index
    @designs = Design.all
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)
    if @design.save
      flash[:notice] = "新規登録しました。"
      redirect_to admin_design_path(@design)
    else
      flash[:alert] = "必要項目を入力してください"
      redirect_to request.referer
    end
  end

  def show
    @design = Design.find(params[:id])
  end

  def edit
    @design = Design.find(params[:id])
  end

  def update
    design = Design.find(params[:id])
    if design.update(design_params)
      flash[:notice] = "変更しました。"
      redirect_to admin_design_path(design)
    else
      flash[:alert] = "必要項目を入力してください"
      redirect_to request.referer
    end
  end

  private

  def design_params
    params.require(:design).permit(:name, :price, :image, :is_ordered)
  end

end
