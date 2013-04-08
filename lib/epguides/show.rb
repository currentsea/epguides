# encoding: UTF-8
require 'json'
require 'nokogiri'
require 'open-uri'
require 'rest-client'

module Epguides
  class Show
    attr_reader :slug, :url

    def initialize(args={})
      @slug = args[:slug]
      @url  = args[:url]
    end

    def episodes
      return @episodes if @episodes
      @episodes = EpisodeList.new
      parse_table.each do |row|
        if m = Episode::REGX.match(row)
          @episodes << Episode.new(m[2], m[3], m[4], m[5], m[6])
        end
      end
      @episodes
    end

    def name
      doc.css('//h1').text
    end

    def season(n)
      Season.new(n.to_s, episodes.find_by_season(n))
    end

    def seasons
      pattern = Regexp.new("•\\s+Season\\s+(\\d+)")
      list.scan(pattern).map do |s|
        Season.new(self, s.first)
      end
    end

    def url
      @url ||= "http://epguides.com/#{@slug}/"
    end

    def self.search(q)
      search_url = 'http://ajax.googleapis.com/ajax/services/search/web' +
        '?v=1.0&q=allintitle: site:epguides.com '
      results = JSON.parse RestClient.get(URI.escape(search_url + q))
      new url: results['responseData']['results'].first['url']
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
  end
end