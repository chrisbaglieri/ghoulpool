class CreatePicks < ActiveRecord::Migration
  def self.up
    create_table :picks do |t|
      t.string :name, :null => false
      t.date :born_on
      t.date :died_on
      t.string :freebase_id

      t.timestamps
    end
    
    add_index :picks, :name, :unique => true
    add_index :picks, :freebase_id, :unique => true
  end

  def self.down
    drop_table :picks
  end
end
