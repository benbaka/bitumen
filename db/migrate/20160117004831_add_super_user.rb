class AddSuperUser < ActiveRecord::Migration
  def up
    User.create(username: "super_admin", password: "super_password", email_address: "super@super.com")
  end

  def down
    User.find_by_username("super_admin").delete
  end
end
