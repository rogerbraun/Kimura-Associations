class AddCompareToWadokuEntry < ActiveRecord::Migration
  def self.up
    add_column :wadoku_entries, :compare, :string
  end

  def self.down
    remove_column :wadoku_entries, :compare
  end
end
