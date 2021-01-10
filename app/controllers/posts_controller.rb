class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to topic_posts_path
    # else
    #   render :index
    end
  end

  private
 
  def post_params
    params.permit(:comment)
  end
end
