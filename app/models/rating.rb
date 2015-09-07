class Rating < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user

  validates_presence_of :blog, :user
  before_validation :check_if_user_has_already_rated_blog, on: :create


  protected
  def check_if_user_has_already_rated_blog
    user = User.find(self.user.id)

    if self.blog != nil
      if self.blog.ratings.where({:user_id => self.user.id}).size >= 1

        errors.add(:user_id, "User has already rated blog")
      end
    end
  end
end
