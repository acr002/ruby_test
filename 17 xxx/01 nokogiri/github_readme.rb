
# https://github.com/sparklemotion/nokogiri/blob/main/README.md

require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(URI.open('https://nokogiri.org/tutorials/installing_nokogiri.html'))

# Search for nodes by css
doc.css('nav ul.menu li a', 'atricle h2').each do |e|
  puts e.content
end

# Search for nodes by xpath
doc.xpath('//nav//ul//li/a', '//article//h2').each do |e|
  puts e.content
end

# Or mix nad match
doc.search('nav ul.menu li a', '//article//h2').each do |e|
  puts e.content
end


