require 'test_helper'

class FrontalsControllerTest < ActionController::TestCase


  test "should_login" do
    @user = User.new
    @user.username="ben"
    @user.password="pass"
    @user.save

    post :login, frontal: {username: 'ben', password: 'password'}
    assert_redirected_to users_path
  end

  test "should get landing_page" do
    get :landing_page
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
