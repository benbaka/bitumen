class Blog < ActiveRecord::Base

  belongs_to :category
  has_many :ratings
  belongs_to :user
  has_many :comments


end
