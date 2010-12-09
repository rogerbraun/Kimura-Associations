class AddCommentFieldsToKimuraEntry < ActiveRecord::Migration
  def self.up
    add_column :kimura_entries, :comment, :text
    add_column :kimura_entries, :kanji_comment, :text
  end

  def self.down
    remove_column :kimura_entries, :comment
    remove_column :kimura_entries, :kanji_comment
  end
end
