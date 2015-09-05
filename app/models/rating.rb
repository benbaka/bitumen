class Rating < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user

  validate :check_if_user_has_already_rated_blog

  def check_if_user_has_already_rated_blog
    user = User.find(self.user.id)

    if self.blog != nil
      if self.blog.ratings.find_by_user_id(self.user.id) != nil

        errors.add(:user_id, "User has already rated blog")
      end
    end
  end
end
