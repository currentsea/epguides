module Epguides
  class EpisodeList < Array
    def find_by_air_date(date)
      self.find {|ep| ep.air_date == date}
    end

    def find_by_season(season)
      self.find_all {|ep| ep.season == season.to_s}
    end
  end
end