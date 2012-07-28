require "minitest_helper"

class StaticPagesControllerTest < MiniTest::Rails::ActionController::TestCase

  test "should show welcome page" do
    visit root_path
    assert_response :success

    assert page.has_content?('Welcome!')
  end

  test "should show stories" do
    create_user
    sign_in @user
    create_story

    visit root_path
    assert_response :success

    assert page.has_content?('New story')
  end

end
