class Public::UsersController < ApplicationController
  
  
  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to users_my_page_path
    else
      redirect_to request.referer
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用をお待ちしております。"
    redirect_to root_path
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end
