require "minitest_helper"

class SessionsControllerTest < MiniTest::Rails::ActionController::TestCase

  def setup
    create_user
    visit signin_path
  end

  test "should not sign in" do
    click_button 'Sign in!'
    
    assert page.has_content?('Invalid email or password')
  end

  test "should sign in" do
    within('form') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Sign in!'

    assert page.has_content?('Logged in!')
  end

  test "should sign out" do
    within('form') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Sign in!'

    click_link 'Sign out'
    assert page.has_content?('Logged out!')
  end

end
