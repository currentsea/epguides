require 'epguides'

class SeasonTest < MiniTest::Unit::TestCase
  include Epguides

  def setup
    @show = Show.new(slug: 'DailyShow')
  end

  def test_season_is_set
    @season = Season.new(1)
    assert_equal 1, @season.season
  end
end