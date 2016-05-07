require 'test_helper'
require 'mocha/setup'
require 'mocha/test_unit'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @blog = blogs(:one)
    @admin = User.new
    @admin.username = "batman"
    @admin.password = "batman"
    @admin.save

    #stub out the current_user which is used to determine if one is logged in
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)


    # get a category object
    @category = categories(:one)

  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should destroy category" do
    delete :destroy, id:@category
    assert_response :redirect
    assert_raises ActiveRecord::RecordNotFound do
      Category.find(@category.id)
    end
  end

  test "should get edit" do
    get :edit, id: @category
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
