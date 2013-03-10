class Show
  attr_reader :slug
  
  def initialize(slug)
    @slug = slug
  end

  def url
    "http://epguides.com/#{@slug}/"
  end
end