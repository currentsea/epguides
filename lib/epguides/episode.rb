module Epguides
  class Episode
    attr_reader :season, :number, :air_date, :title

    def initialize(season, number, air_date, title)
      @season   = season
      @number   = number
      @air_date = parse_date(air_date)
      @title    = title.strip
    end

    private

    def parse_date(date)
      DateTime.strptime(date, "%d/%b/%y").to_date
    end
  end
end
