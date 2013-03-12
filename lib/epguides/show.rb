# encoding: UTF-8
require 'open-uri'

module Epguides
  class Show
    attr_reader :slug

    def initialize(slug)
      @slug = slug
    end

    def name
      doc.css('//h1').text
    end

    def seasons
      pattern = Regexp.new("•\\s+Season\\s+(\\d+)")
      list.scan(pattern).map do |s|
        Season.new(self, s.first)
      end
    end

    def url
      "http://epguides.com/#{@slug}/"
    end

    private

    def doc
      Nokogiri::HTML(open(url))
    end

    def list
      doc.xpath('//div[@id = "eplist"]').text
    end
  end
end