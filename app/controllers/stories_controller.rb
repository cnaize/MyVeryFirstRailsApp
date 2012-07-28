
class StoriesController < ApplicationController

  def show
    @story = current_user.stories.find(params[:id])
    @comment = Comment.new
    @feed_items = @story.comments
  end

  def new
    @story = Story.new
    @users = construct_users
  end

  def create
    @story = current_user.stories.build(params[:story])
    if @story.save
      redirect_to root_path, notice: "Story created!"
    else
      @users = construct_users
      render "new"
    end
  end

  def construct_users
    users = []
    User.all.each do |user|
      users << user.name
    end
  end

  def change
    @story = current_user.stories.find(params[:id])
    case params[:do]
      when 'start'
        @story.start!
      when 'finish'
        @story.finish!
      when 'deliver'
        @story.deliver!
      when 'accept'
        @story.accept!
      when 'reject'
        @story.reject!
      when 'restart'
        @story.restart!
    end
    redirect_to root_path
  end
end
