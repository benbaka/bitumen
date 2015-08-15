class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :summary
      t.text :body
      t.datetime :date_of_creation

      t.timestamps null: false
    end
  end
end
