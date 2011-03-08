class AddWordcountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :wordcount, :integer
  end

  def self.down
    remove_column :users, :wordcount
  end
end
