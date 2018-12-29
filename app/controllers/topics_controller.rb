class TopicsController < ApplicationController
  layout "blog"
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    if logged_in?(:admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.recent.published.page(params[:page]).per(5)
    end
  end

  def new
    @topic = Topic.new
  end
  def create
    @topic = Topic.new(topic_params)
    respond_to do |format|
      if @topic.save
        binding.pry
        format.html { redirect_to @topic, notice: 'topic was successfully created.' }
      else
        binding.pry
        format.html { render :new }
      end
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end
