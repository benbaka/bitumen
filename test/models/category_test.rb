require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should add a blog to category" do

    blog = Blog.new({:title => "My first blog", :summary => "My first blog"})
    blog.body = "This is the first of a series of investigative blogs"
    blog.save
    category = Category.new({:name => "general"})
    category.save

    category.blogs << blog

    assert_equal category.blogs.count, 1
    assert_equal category.blogs.many?, false
  end
end
