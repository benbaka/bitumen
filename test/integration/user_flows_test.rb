require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @admin = User.new
    @admin.username = "batman"
    @admin.password = "batman"
    @admin.save
  end
  
  test "should redirect to login when not logged in" do
    get "/blogs"
    assert_redirected_to frontals_home_url
    assert_response 302
  end

  test "should login and be redirected to blogs index" do

    post "/frontals/login", :frontal=>{ username: "batman", password: "batman"}
    assert_redirected_to blogs_path
    assert_response 302
  end

end
