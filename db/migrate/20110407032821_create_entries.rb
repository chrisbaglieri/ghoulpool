class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :user_id
      t.integer :ghoul_id
      t.integer :pool_id
      t.integer :points, :default => 0

      t.timestamps
    end
    
    add_index :entries, :user_id
    add_index :entries, :ghoul_id
    add_index :entries, :pool_id
  end

  def self.down
    drop_table :entries
  end
end
