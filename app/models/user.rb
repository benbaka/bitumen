class User < ActiveRecord::Base
  has_many :ratings
  has_many :blogs

  validates_uniqueness_of :username

  has_secure_password

end
