
class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @feed_items = current_user.stories
    end
  end

  def sort_by_name
    @feed_items = current_user.stories.find(:all, order: 'responsible')
    render 'home'
  end

  def sort_by_state
    @feed_items = current_user.stories.find(:all, order: 'state')
    render 'home'
  end
end
