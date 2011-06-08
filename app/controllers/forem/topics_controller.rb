module Forem
  class TopicsController < ApplicationController
    before_filter :authenticate_forem_user!, :only => [:new, :create]
    def index
      @topics = Forem::Topic.all
    end
    
    def new
      @topic = Forem::Topic.new
      @topic.posts.build
    end
    
    def create
      params[:topic].merge!(:user => current_user)
      @topic = Forem::Topic.create(params[:topic])
      flash[:notice] = "Topic has been created!"
      redirect_to @topic
    end
    
    def show
      @topic = Forem::Topic.find(params[:id])
    end
  end
end