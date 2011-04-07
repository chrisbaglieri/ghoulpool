class AddUserToPool < ActiveRecord::Migration
  def self.up
    add_column :pools, :user_id, :integer
    add_index :pools, :user_id
  end

  def self.down
    remove_index :pools, :user_id
    remove_column :pools, :user_id
  end
end
