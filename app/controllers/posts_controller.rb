class PostsController < ApplicationController
  def index
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
    @posts = @topic.posts
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new(post_params)
    if @post.save
      render json:{ post: @post }
      # redirect_to topic_posts_path(@topic)
    else
      @posts = @topic.posts
      render :index
    end
  end

  private
 
  def post_params
    params.require(:post).permit(:comment)
  end
end