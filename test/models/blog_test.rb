require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a blog should belong to a category" do

    category = Category.new({:name => "general"})
    category.save

    blog = Blog.new({:title => "My first blog", :summary => "My first blog"})
    blog.body = "This is the first of a series of investigative blogs"
    blog.category = category
    blog.save

    assert_equal blog.category.present?, true
  end
end
