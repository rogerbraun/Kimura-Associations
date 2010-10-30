class AddIndices < ActiveRecord::Migration
  def self.up
    add_index :wadoku_entries, :reading
    add_index :kimura_entries, :reading
  end

  def self.down
    remove_index :wadoku_entries, :reading
    remove_index :kimura_entries, :reading
    
  end
end
