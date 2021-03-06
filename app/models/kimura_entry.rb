#encoding: utf-8
class KimuraEntry < ActiveRecord::Base
  before_save :update_comparable_reading
  before_save :update_wordcount

  def wadoku_candidates
    WadokuEntry.where(:compare=> compare) || []
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
  belongs_to :user

  private
    REPLACE = { "â" => "ā",
                "î" => "ī",
                "û" => "ū",
                "ê" => "ē",
                "ô" => "ō",
                "ä" => "ā",
                "ï" => "ī",
                "ü" => "ū",
                "ë" => "ē",
                "ö" => "ō",
                "n-a" => "n’a",
                "n-e" => "n’e",
                "n-i" => "n’i",
                "n-o" => "n’o",
                "n-u" => "n’u",
                "n-y" => "n’y",
                "-" => "·",
                #"." => "-",
                "mb" => "nb",
                "mp" => "np"
    }
  
  def make_comparable_reading
    temp = reading.dup
    REPLACE.each do |k,v|
      temp.gsub!(k,v)
    end
    temp.downcase!
    temp.gsub(/[^a-zA-Zīūēōā]/,"")
  end

  def update_comparable_reading
    self.compare = make_comparable_reading
  end

  def update_wordcount
    user = self.user
    user.wordcount += self.comment.chars.to_a.size - (self.comment_was ? self.comment_was.chars.to_a.size : 0) 
    user.save  
  end

end
