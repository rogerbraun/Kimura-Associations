class AddReadingToWadokuEntry < ActiveRecord::Migration
  def self.up
    add_column :wadoku_entries, :reading, :string
  end

  def self.down
    remove_column :wadoku_entries, :reading, :string
  end
end
