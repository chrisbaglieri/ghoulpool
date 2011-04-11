class CreatePoolsUsers < ActiveRecord::Migration
  def self.up
    create_table :pools_users, :id => false do |t|
      t.integer :pool_id
      t.integer :user_id
    end
    add_index :pools_users, :pool_id, :name => 'pools_users_pool_id'
    add_index :pools_users, :user_id, :name => 'pools_users_user_id'
  end

  def self.down
    drop_table :pools_users
  end
end
