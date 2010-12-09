class KimuraEntry < ActiveRecord::Base

  def wadoku_candidates
    WadokuEntry.where(:reading => reading) || []
  end

  def reading_with_number
    "#{self.reading} #{self.number}" 
  end

  def number
    homonyms = KimuraEntry.where(:reading => reading)
    first = homonyms.first
  
    if homonyms.count == 1 then
      ""
    else
      (self.id + 1 - first.id).to_s     
    end 

  end

  belongs_to :wadoku_entry


end
