class WadokuEntry < ActiveRecord::Base
  before_save :update_comparable_reading
  def kanji_and_translation
    "#{kanji}: #{translation}"
  end
  has_one :kimura_entry

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

end
