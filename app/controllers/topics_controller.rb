class TopicsController < ApplicationController
  def index
    @topics = Topic.order('created_at DESC')
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create(topic_params)
    if @topic.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
 
  def topic_params
    params.require(:topic).permit(:title)
  end
end
