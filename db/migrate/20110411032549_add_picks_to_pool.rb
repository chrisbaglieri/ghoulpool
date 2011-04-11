class AddPicksToPool < ActiveRecord::Migration
  def self.up
    add_column :pools, :picks, :integer
  end

  def self.down
    remove_column :pools, :picks
  end
end
