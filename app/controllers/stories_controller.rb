
class StoriesController < ApplicationController

  def new
    @story = Story.new
    $users = []
    User.all.each do |user|
      $users << user.name
    end
  end

  def create
    @story = current_user.stories.build(params[:story])
    if @story.save
      redirect_to root_path, notice: "Story created!"
    else
      render "new"
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
