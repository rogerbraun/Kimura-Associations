class CreateWadokuEntries < ActiveRecord::Migration
  def self.up
    create_table :wadoku_entries do |t|
      t.integer :wadoku_id
      t.string :kanji
      t.string :translation

      t.timestamps
    end
  end

  def self.down
    drop_table :wadoku_entries
  end
end
