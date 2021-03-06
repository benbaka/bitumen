require 'test_helper'
require 'mocha/setup'
require 'mocha/test_unit'

class BlogsControllerTest < ActionController::TestCase
  setup do
    @blog = blogs(:one)
    @admin = User.new
    @admin.username = "batman"
    @admin.password = "batman"
    @admin.save

    #stub out the current_user which is used to determine if one is logged in
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    # associate the blog with the user
    @blog.user = @admin

    # associate blog with category
    @category = categories(:one)
    @blog.category = @category
    @blog.save

  end


  test "should get index" do

    get :index
    assert_response :success
    assert_not_nil assigns(:blogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blog" do
    assert_difference('Blog.count') do
      post :create, blog: { body: @blog.body, date_of_creation: @blog.date_of_creation, summary: @blog.summary, title: @blog.title }
    end

    assert_redirected_to blog_path(assigns(:blog))
  end

  test "should show blog" do
    get :show, id: @blog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blog
    assert_response :success
  end

  test "should update blog" do
    patch :update, id: @blog, blog: { body: @blog.body, date_of_creation: @blog.date_of_creation, summary: @blog.summary, title: @blog.title }
    assert_redirected_to blog_path(assigns(:blog))
  end

  test "should destroy blog" do
    assert_difference('Blog.count', -1) do
      delete :destroy, id: @blog
    end

    assert_redirected_to blogs_path
  end
end
