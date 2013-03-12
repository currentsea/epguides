module Epguides
  class Season
    attr_reader :show, :season
  
    def initialize(show, season)
      @show = show
      @season = season
    end
  end
end