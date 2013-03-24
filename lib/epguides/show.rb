# encoding: UTF-8
require 'open-uri'

module Epguides
  class Show
    attr_reader :slug

    def episodes
      regx = /(\d+)\s+(\d+)-(\d+)\s+(\d+\/\w{3}\/\d{2})\s+(.+\Z)/
      parse_table.inject([]) do |eps, line|
        if m = regx.match(line)
          episode = Episode.new(m[2], m[3], m[4], m[5])
          eps + [episode]
        else
          eps
        end
      end
    end

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

    private

    def doc
      Nokogiri::HTML(open(url))
    end

    def list
      doc.xpath('//div[@id = "eplist"]').text
    end

    def parse_table
      titles = doc.xpath('//div[@id = "eplist"]//a').text
      doc.xpath('//div[@id = "eplist"]').text.split("\r\n")
    end

    def url
      "http://epguides.com/#{@slug}/"
    end
  end
end