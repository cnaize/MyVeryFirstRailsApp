
class CommentsController < ApplicationController

  def new
    @story = current_user.stories.find(params[:story_id])
    @comment = Comment.new
  end
  
  def create
    @story = current_user.stories.find(params[:story_id])
    @comment = @story.comments.build(params[:comment])
    if @comment.save
      redirect_to story_path(@story), notice: 'Comment added!'
    else
      @feed_items = @story.comments
      render 'stories/show'
    end
  end
end
