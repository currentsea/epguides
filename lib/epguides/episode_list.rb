module Epguides
  class EpisodeList < Array
    def find_by_air_date(date)
      self.find {|ep| ep.air_date == date}
    end
  end
end