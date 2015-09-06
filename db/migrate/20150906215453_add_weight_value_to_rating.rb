class AddWeightValueToRating < ActiveRecord::Migration
  def self.up
    add_column :ratings, :value, :integer
  end

  def self.down
    remove_column :ratings, value
  end
end
