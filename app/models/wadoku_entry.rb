class WadokuEntry < ActiveRecord::Base

  has_one :kimura_entry

  def kanji_and_translation
    "#{kanji}: #{translation[0..60]}#{translation.size >= 60 ? '...' :''}"
  end
end
