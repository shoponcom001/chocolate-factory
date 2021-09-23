class Public::LikesController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    @like = @blog.likes.new(user_id: current_user.id)
    @like.save
    redirect_to request.referer
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @like = @blog.likes.find_by(user_id: current_user.id)
    @like.destroy
    redirect_to request.referer
  end

end
