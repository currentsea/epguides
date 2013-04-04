module Epguides
  class Season
    attr_reader :episodes, :season
  
    def initialize(season, episodes=[])
      @episodes = episodes
      @season = season
    end

    def episode(n)
      @episodes.find {|ep| ep.number.to_i == n}
    end
  end
end