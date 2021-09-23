class Public::BlogCommentsController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = BlogComment.new(blog_comment_params)
    @blog_comment.blog_id = @blog.id
    @blog_comment.user_id = current_user.id
    if  @blog_comment.save
      redirect_to blog_path(@blog.id)
    else
      flash[:alert] = "コメントを入力してください"
      redirect_to request.referer
    end
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    blog_comment = @blog.blog_comments.find(params[:id])
    blog_comment.destroy
    flash[:alert] = "削除しました"
    redirect_to request.referer
  end

  private

  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end

end
