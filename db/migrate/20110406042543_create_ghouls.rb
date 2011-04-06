class CreateGhouls < ActiveRecord::Migration
  def self.up
    create_table :ghouls do |t|
      t.string :name, :null => false
      t.date :born_on, :null => false
      t.date :died_on
      t.string :freebase_id

      t.timestamps
    end
    
    add_index :ghouls, :name, :unique => true
    add_index :ghouls, :freebase_id, :unique => true
  end

  def self.down
    drop_table :ghouls
  end
end
