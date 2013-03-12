require 'epguides'

class ShowTest < MiniTest::Unit::TestCase
  include Epguides

  def setup
    @show = Show.new('DailyShow')
  end
  
  def test_slug_is_set_and_readable
    assert_equal 'DailyShow', @show.slug
  end

  def test_provides_url
    assert_equal 'http://epguides.com/DailyShow/', @show.url
  end

  def test_name
    assert_equal 'The Daily Show', @show.name
  end
end