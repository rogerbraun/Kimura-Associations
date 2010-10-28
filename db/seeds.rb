# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

kimura = open("db/seeds/kimura_lemmata2.txt")

kimura.lines.each_with_index do |line, index|

  unless line.strip.empty?
    if KimuraEntry.create(:reading => line.strip)
      puts "Saved kimura #{index}"
    end
  end

  if Rails.env.development? then
    break if index > 1000
  end

end

wadoku = open("db/seeds/WaDoku RomajiAbgleich.tab").read.gsub("\r","\n")

wadoku.lines.each_with_index do |entry, index|

  temp = entry.split("\t")
  if WadokuEntry.create(:wadoku_id => temp[0],:reading => temp[1], :kanji => temp[2], :translation => temp[4])
    puts "saved wadoku"
  else
    puts "not saved"
  end
  if Rails.env.development? then
    break if index > 1000
  end

end

