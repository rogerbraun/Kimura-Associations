class KimuraEntry < ActiveRecord::Base

  def wadoku_candidates
    WadokuEntry.where(:reading => reading) || []
  end

  def reading_with_number
    reading + " " + number
  end

  def number
    homonyms = KimuraEntry.where(:reading => reading)
    first = homonyms.first
  
    "#{self.id + 1 - first.id}" 
  end

  belongs_to :wadoku_entry


end
