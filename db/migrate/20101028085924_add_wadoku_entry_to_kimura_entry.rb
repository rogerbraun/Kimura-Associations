class AddWadokuEntryToKimuraEntry < ActiveRecord::Migration
  def self.up
    add_column :kimura_entries, :wadoku_entry_id, :integer
  end

  def self.down
    remove_column :kimura_entries, :wadoku_entry_id
  end
end
