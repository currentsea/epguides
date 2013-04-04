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

  def test_episode_can_be_fetched_from_season
    season = @show.season(4)
    episode = season.episode(1)
    assert_equal 'Michael J. Fox', episode.title
  end
end