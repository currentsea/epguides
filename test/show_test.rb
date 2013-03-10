require_relative '../lib/show.rb'

class ShowTest < MiniTest::Unit::TestCase
  def setup
    @show = Show.new('DailyShow')
  end
  
  def test_slug_is_set_and_readable
    assert_equal 'DailyShow', @show.slug
  end

  def test_provides_url
    assert_equal 'http://epguides.com/DailyShow/', @show.url
  end
end