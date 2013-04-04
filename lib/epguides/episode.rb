module Epguides
  class Episode
    REGX = /(\d+)\s+(\d+)-(\d+)\s+(.*)\s+(\d+\/\w{3}\/\d{2})\s+(.+\Z)/

    attr_reader :season, :number, :air_date, :title

    def initialize(season, number, prod_number, air_date, title)
      @season       = season
      @number       = number
      @prod_number  = prod_number.strip
      @air_date     = parse_date(air_date)
      @title        = title.strip
    end

    private

    def parse_date(date)
      DateTime.strptime(date, "%d/%b/%y").to_date
    end
  end
end
