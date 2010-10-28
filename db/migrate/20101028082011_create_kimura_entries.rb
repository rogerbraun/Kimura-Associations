class CreateKimuraEntries < ActiveRecord::Migration
  def self.up
    create_table :kimura_entries do |t|
      t.string :reading

      t.timestamps
    end
  end

  def self.down
    drop_table :kimura_entries
  end
end
