
# https://kic-yuuki.hatenablog.com/entry/2019/06/18/091451

require 'nokogiri'
require 'pp'

html = open('./index01.html', &:read)
doc = Nokogiri::HTML.parse(html, nil)
p doc.class
pp doc

doc.search('input').each do |e|
  p e.attributes
  p e.attributes['type'].value
  p e.attributes['name'].value if e.attributes['name']
  p e.attributes['id'].value if e.attributes['id']
  p e.attributes['value'].value
end
doc.css('.nokogiri').each do |e|
  p e.attributes
  p e.content
end
