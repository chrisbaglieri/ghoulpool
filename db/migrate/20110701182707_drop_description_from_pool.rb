class DropDescriptionFromPool < ActiveRecord::Migration
  def self.up
    change_table :pools do |t|
      t.remove :description
    end
  end

  def self.down
    change_table :pools do |t|
      t.text :description
    end
  end
end
