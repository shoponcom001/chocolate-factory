class Admin::BlogsController < Admin::AdminsController
  before_action :authenticate_admin!

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = "新規投稿しました"
      redirect_to admin_blogs_path
    else
      flash[:alert] = "必須項目を入力してください"
      redirect_to request.referer
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.update(blog_params)
      flash[:notice] = "変更しました"
      redirect_to admin_blog_path(blog)
    else
      flash[:alert] = "必須項目を入力してください"
      redirect_to request.referer
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    flash[:alert] = "削除しました"
    redirect_to admin_blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :image)
  end

end
