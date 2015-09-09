class Blog < ActiveRecord::Base

  belongs_to :category
  has_many :ratings
  belongs_to :user


end
