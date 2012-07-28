require "minitest_helper"

class StoriesControllerTest < MiniTest::Rails::ActionController::TestCase

  def setup
    create_user
    sign_in @user
  end

  test "should not create story" do
    visit new_story_path
    assert_response :success

    click_button 'Create'
    assert page.has_content?("can't be blank")
  end

  test "should create story" do
    visit new_story_path
    assert_response :success

    within('form') do
      select 'User', from: 'Responsible'
      fill_in 'Description', with: 'New story'
    end
    click_button 'Create'

    assert page.has_content?('Story created!')
  end

  test "should show story" do
    create_story

    visit story_path(@story)
    assert_response :success

    assert page.has_content?('New story')
  end

end
