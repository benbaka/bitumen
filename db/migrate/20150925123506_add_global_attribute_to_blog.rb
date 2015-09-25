class AddGlobalAttributeToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :global, :boolean
  end

  def self.down
    remove_column :blogs, global 
  end
end
