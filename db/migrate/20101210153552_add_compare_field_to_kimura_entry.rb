class AddCompareFieldToKimuraEntry < ActiveRecord::Migration
  def self.up
    add_column :kimura_entries, :compare, :string
  end

  def self.down
    remove_column :kimura_entries, :compare
  end
end
