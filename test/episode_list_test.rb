require 'epguides'

class EpisodeListTest < MiniTest::Unit::TestCase
  include Epguides

  def setup
    @show = Show.new(slug: 'DailyShow')
  end

  def test_find_by_air_date
    @episode = @show.episodes.find_by_air_date(Date.new(1998,3,9))
    assert_equal 'Miguel Ferrer', @episode.title
  end
end