require "minitest_helper"

class UsersControllerTest < MiniTest::Rails::ActionController::TestCase

  def setup
    visit signup_path
  end

  test "should not create user" do
    click_button 'Sign up!'
    assert page.has_content?("can't be blank")
  end

  test "should create user" do
    within('form') do
      fill_in 'Name', with: 'User'
      fill_in 'Email', with: '1'
      fill_in 'Password', with: '1'
      fill_in 'Password confirmation', with: '1'
    end
    click_button 'Sign up!'

    assert page.has_content?('Signed up!')
  end

end
