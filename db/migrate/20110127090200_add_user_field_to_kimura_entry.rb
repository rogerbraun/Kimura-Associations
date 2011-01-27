class AddUserFieldToKimuraEntry < ActiveRecord::Migration
  def self.up
    add_column :kimura_entries, :user_id, :integer
  end

  def self.down
    remove_colummn :kimura_entries, :user_id
  end
end
