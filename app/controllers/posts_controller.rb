class PostsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @posts = @topic.posts
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new(post_params)
    if @post.save
      redirect_to topic_posts_path(@topic)
    # else
    #   render :index
    end
  end

  private
 
  def post_params
    params.permit(:comment)
  end
end
