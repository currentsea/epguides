module Epguides
  class Season
    attr_reader :episodes, :season
  
    def initialize(season, episodes=[])
      @episodes = episodes
      @season = season
    end
  end
end