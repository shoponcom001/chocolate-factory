class Public::BlogsController < ApplicationController
  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
    @blog = Blog.find(params[:id])
    @blog_comment = BlogComment.new
  end
end
