$:.unshift File.expand_path('../lib', __FILE__)
require 'epguides/version'

Gem::Specification.new do |gem|
  gem.name    = 'epguides'
  gem.version = Epguides::VERSION

  gem.author      = 'Matt Manning'
  gem.email       = 'matt.manning@gmail.com'
  gem.homepage    = 'https://github.com/mattmanning/epguides'
  gem.summary     = 'Query the epguides.com website for TV show information.'
  gem.description = 'Query the epguides.com website for TV show information.'

  gem.files = %x{ git ls-files }.split("\n").select { |d| d =~ %r{^(README|lib/)} }

  gem.add_dependency 'json', '~> 1.7.7'
  gem.add_dependency 'nokogiri', '~> 1.5.6'
  gem.add_dependency 'rest-client', '~> 1.6.7'

  gem.add_development_dependency 'minitest', '~> 4.6.2'
  gem.add_development_dependency 'turn', '~> 0.9.6'
end
