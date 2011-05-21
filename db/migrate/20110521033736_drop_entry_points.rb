class DropEntryPoints < ActiveRecord::Migration
  def self.up
    remove_column :entries, :points
  end

  def self.down
    add_column :entries, :points, :integer, :default => 0
  end
end
