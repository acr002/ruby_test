
# https://qiita.com/momokahori/items/851e4c36c5b5c4c2ef98

require 'nokogiri'
require 'open-uri'

url = 'https://qiita.com/search?q=ruby'

puts '==== html ===='
fd = URI.open(url)
html = fd.read
puts html

puts ' ==== charset ===='
fd = URI.open(url)
charset = fd.charset
puts charset

puts '==== url ===='
fd = URI.open(url)
uri = fd.base_uri
puts uri



