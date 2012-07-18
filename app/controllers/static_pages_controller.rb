
class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @feed_items = current_user.stories
    end
  end
end
