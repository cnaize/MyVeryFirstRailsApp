require "minitest_helper"

class CommentsControllerTest < MiniTest::Rails::ActionController::TestCase

  def setup
    create_user
    sign_in @user
    create_story
    visit new_story_comment_path(@story)
  end  

  test "should not create comment" do
    click_button 'Comment'
    assert page.has_content?("can't be blank")
  end

  test "should create comment" do
    within('form') do
      fill_in 'Comment', with: 'New comment'
    end
    click_button 'Comment'

    assert page.has_content?('Comment added!')
  end

end
