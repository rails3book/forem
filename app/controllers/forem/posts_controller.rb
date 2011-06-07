module Forem
  class PostsController < ApplicationController
    before_filter :find_topic

    def new
      @post = @topic.posts.build
    end
    
    def create
      @post = @topic.posts.create(params[:post])
      flash[:notice] = "Post has been created!"
      redirect_to topic_path(@topic)
    end

    private

    def find_topic
      @topic = Forem::Topic.find(params[:topic_id])
    end
  end
end