class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :index
    end
  end

  private
 
  def post_params
    params.require(:post).permit(:name, :content)
  end
end
