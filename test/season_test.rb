require 'epguides'

class SeasonTest < MiniTest::Unit::TestCase
  include Epguides

  def setup
    @show = Show.new(slug: 'DailyShow')
  end

  def test_show_is_set
    @season = Season.new(@show, 1)
    assert_equal @show, @season.show
  end

  def test_season_is_set
    @season = Season.new(@show, 1)
    assert_equal 1, @season.season
  end
end