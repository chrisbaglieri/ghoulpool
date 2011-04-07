class CreateRules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      t.integer :pool_id
      t.string :function

      t.timestamps
    end
    
    add_index :rules, :pool_id
  end

  def self.down
    drop_table :rules
  end
end
