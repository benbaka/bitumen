require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should redirect to login when not logged in" do
    get "/blogs"
    assert_redirected_to frontals_home_url
    assert_response 302
  end

  test "should login and be redirected to blogs index" do

  end

end
