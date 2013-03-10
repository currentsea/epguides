require 'open-uri'
require 'nokogiri'

class Show
  attr_reader :slug
  
  def initialize(slug)
    @slug = slug
  end

  def url
    "http://epguides.com/#{@slug}/"
  end

  def name
    doc.css('//h1').text
  end

  private

  def doc
    @doc ||= Nokogiri::HTML(open(url))
  end
end