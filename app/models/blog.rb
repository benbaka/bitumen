class Blog < ActiveRecord::Base

  validates_presence_of :title
  belongs_to :category
  has_many :ratings
  belongs_to :user
  has_many :comments

  has_attached_file :blog_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :blog_image, content_type: /\Aimage\/.*\Z/


end
