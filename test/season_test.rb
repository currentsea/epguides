require_relative '../lib/show.rb'
require_relative '../lib/season.rb'

class SeasonTest < MiniTest::Unit::TestCase
  def setup
    @show = Show.new('DailyShow')
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