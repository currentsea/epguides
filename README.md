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

show2 = Epguides::Show.new(:slug => 'Archer')
#=> #<Epguides::Show:0x007fcdf388ed20 @slug="Archer", @url=nil>
show2.episodes.first
#=> #<Epguides::Episode:0x007fcdf34a4840 @season="1", @number="01", @prod_number="AR01001", @air_date=#<Date: 2009-09-17 ((2455092j,0s,0n),+0s,2299161j)>, @title="Mole Hunt  [Trailer]">
show2.episodes.find_by_air_date(Date.new(2013,2,21))
#=> #<Epguides::Episode:0x007fcdf34951b0 @season="4", @number="06", @prod_number="XAR04007", @air_date=#<Date: 2013-02-21 ((2456345j,0s,0n),+0s,2299161j)>, @title="Once Bitten">

```

License
-------
MIT