class KimuraEntry < ActiveRecord::Base

  def wadoku_candidates
    WadokuEntry.where(:reading => reading) || []
  end

  def reading_with_number
    homonyms = KimuraEntry.where(:reading => reading)
    first = homonyms.first
  
    if homonyms.count == 1 then
      reading
    else
      reading + " #{self.id + 1 - first.id}" 
      
    end 

  end

  belongs_to :wadoku_entry


end
