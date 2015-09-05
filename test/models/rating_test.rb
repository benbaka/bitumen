require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should create associate a blog with many ratings" do
    blog = Blog.new({:title=>"the me blog"})
    assert_empty blog.ratings

    rating1 = ratings(:one)
    rating2 = ratings(:two)
    blog.ratings << rating1
    blog.ratings << rating2
    blog.save

    assert_equal blog.ratings.size, 2

    user1 = users(:ben)
    user2 = users(:admin)
    rating1.user = user1
    rating1.save

    assert_not_nil rating1.user

    assert_not_nil user1.ratings

  end

  test "should not store a rating by a user more than twice" do
    Rating.delete_all
    blog = Blog.new({:title=>"the me blog"})
    blog.save

    user = User.new({:username=>"ben"})
    user.save

    rating = Rating.new({:user_id=>user.id})
    blog.ratings << rating
    assert blog.save
    assert_empty blog.errors
    assert_equal 1, blog.ratings.size

    # Now test unsuccessfull rating of a blog by same person twice

    assert_equal false, blog.ratings << rating
    assert_equal 1, blog.ratings.size
    assert_equal 1, Rating.all.size


  end

  test "should not store a rating by a user more than twice the manual way" do
    Rating.delete_all
    blog = Blog.new({:title=>"the me blog"})
    blog.save

    user = User.new({:username=>"ben"})
    user.save

    rating = Rating.new({:user_id=>user.id})
    blog.ratings << rating
    assert blog.save
    assert_empty blog.errors
    assert_equal 1, blog.ratings.size

    # Now test unsuccessfull rating of a blog by same person twice
    rating.user = user
    assert_equal false, rating.save
    assert_equal 1, blog.ratings.size
    assert_equal 1, Rating.all.size

  end



  test "should produce error on saving a new rating" do
    rating = Rating.new()
    assert_raise Exception do
      rating.save
    end
    assert 2, rating.errors.size

  end
end


