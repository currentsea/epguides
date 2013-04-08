Epguides
========

Epguides makes it easy to look up TV episode information from http://epguides.com if you know either the season and episode number or the air date of an episode.

Installation
------------

gem install epguides

Usage
-----

```ruby
require 'epguides'
#=> true 

show = Epguides::Show.search("The Colbert Report")
#=> #<Epguides::Show:0x007fc001c71618 @slug=nil, @url="http://epguides.com/ColbertReport/"> 

show.name
#=> "The Colbert Report" 

episode = show.season(8).episode(33)
#=> #<Epguides::Episode:0x007fc001b794b8 @season="8", @number="33", @prod_number="", @air_date=#<Date: 2012-03-08 ((2455995j,0s,0n),+0s,2299161j)>, @title="Don Fleming, Elvis Costello, Emmylou Harris">
 ```

License
-------
MIT