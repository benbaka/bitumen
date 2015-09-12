class Comment < ActiveRecord::Base
  belongs_to :blog
  has_one :user
end
