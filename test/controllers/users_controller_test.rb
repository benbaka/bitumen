require 'test_helper'
require 'mocha/setup'
require 'mocha/test_unit'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = User.new
    @user.username = "batman"
    @user.password = "batman"
    @user.save

    #stub out the current_user which is used to determine if one is logged in
    ApplicationController.any_instance.stubs(:current_user).returns(@user)

  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not create user twice" do
    assert_no_difference('User.count') do
      post :create, user: { email_address: @user.email_address, password: @user.password, username: @user.username }
    end
    
    assert_response :success
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { email_address: @user.email_address, password: @user.password, username: @user.username }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
