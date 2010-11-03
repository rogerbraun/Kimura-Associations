class WadokuEntry < ActiveRecord::Base


  def kanji_and_translation
    "#{kanji}: #{translation}"
  end
  has_one :kimura_entry
end
