class KimuraEntry < ActiveRecord::Base

  def wadoku_candidates
    WadokuEntry.where(:reading => reading) || []
  end

  belongs_to :wadoku_entry

  cattr_reader :per_page

  @@per_page = 10

end
