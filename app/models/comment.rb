class Comment < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user

  validate :user_can_not_comment_on_his_blog


  protected
  def user_can_not_comment_on_his_blog
    begin
      if self.blog.user.id == self.user.id
        errors.add(:user_id, "You can not comment on your own blog.")
      end
    rescue Exception

    end
  end
  end

