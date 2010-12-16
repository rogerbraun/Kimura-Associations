class KimuraEntry < ActiveRecord::Base
  before_save :update_comparable_reading

  def wadoku_candidates
    WadokuEntry.where(:reading => compare) || []
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

  private
  
  def make_comparable_reading
    replace = { "â" => "ā",
                "î" => "ī",
                "û" => "ū",
                "ê" => "ē",
                "ô" => "ō",
                "ä" => "ā",
                "ï" => "ī",
                "ü" => "ū",
                "ë" => "ē",
                "ö" => "ō",
                "·" => "-",
                "." => "-",
                "n-a" => "n’a",
                "n-e" => "n’e",
                "n-i" => "n’i",
                "n-o" => "n’o",
                "n-u" => "n’u",
                "n-y" => "n’y",
                "mb" => "nb",
                "mp" => "np"
}
    temp = reading.dup
    replace.each do |k,v|
      temp.gsub!(k,v)
    end
    temp
  end

  def update_comparable_reading
    self.compare = make_comparable_reading
  end

end
