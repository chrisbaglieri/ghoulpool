class CreateRankings < ActiveRecord::Migration
  def self.up
    create_table :rankings do |t|
      t.integer :pool_id
      t.integer :user_id
      t.decimal :score

      t.timestamps
    end
    
    add_index :rankings, :pool_id
    add_index :rankings, :user_id
  end

  def self.down
    drop_table :rankings
  end
end
