class AddComparisonIndices < ActiveRecord::Migration
  def self.up
    add_index :wadoku_entries, :compare
    add_index :kimura_entries, :compare
  end

  def self.down
    remove_index :wadoku_entries, :compare
    remove_index :kimura_entries, :compare
    
  end
end
