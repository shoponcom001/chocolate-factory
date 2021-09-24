class Admin::UsersController < Admin::AdminsController
  def index
    @users = User.all.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "変更しました。"
      redirect_to admin_user_path(user)
    else
      flash[:alert] = "必要項目を入力してください"
      redirect_to request.referer
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end

end
