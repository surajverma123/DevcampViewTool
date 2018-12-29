class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  layout "blog"
  def index
    @topics = Topic.all
  end

  def show
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
        format.html { redirect_to @topic, notice: 'topic was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  def edit
  end

  def destroy
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
    end
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

end
