require 'test_helper'
require 'mocha/setup'
require 'mocha/test_unit'


class RatingsControllerTest < ActionController::TestCase
  setup do
    @blog = blogs(:one)
    @admin = User.new
    @admin.username = "batman"
    @admin.password = "batman"
    @admin.save
    @blog.user = @admin
    @blog.save

    #stub out the current_user which is used to determine if one is logged in
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    @rating = ratings(:one)
    @rating.user = @admin
    @blog.ratings<<@rating
    @rating.blog = @blog
    @rating.save
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not create rating for same user twice for a blog" do
    assert_no_difference('Rating.count') do
      post :create, rating: { blog_id: @rating.blog_id, user_id: @rating.user_id }
    end

    assert_template :new
    
  end

  test "should show rating" do
    get :show, id: @rating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating
    assert_response :success
  end

  test "should update rating" do
    patch :update, id: @rating, rating: { blog_id: @rating.blog_id, user_id: @rating.user_id }
    assert_redirected_to blog_path(@blog)
  end

  test "should destroy rating" do
    assert_difference('Rating.count', -1) do
      delete :destroy, id: @rating
    end

    assert_redirected_to ratings_path
  end
end
