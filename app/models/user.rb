class User < ActiveRecord::Base
  has_many :ratings
  has_many :blogs
  has_many :comments
end
