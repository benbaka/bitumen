require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should create a blog and assign comments to it" do
    blog = blogs(:one)
    user = users(:one)
    comment1 = comments(:one)
    comment2 = comments(:two)

    comment1.user = user
    comment2.user = user
    comment1.save
    comment2.save

    blog.comments << comment1
    blog.comments << comment2
    blog.save


    assert_not_empty blog.comments
    assert_equal 2, Comment.where(:user_id => user.id).size
  end
end
