

# https://qiita.com/momokahori/items/851e4c36c5b5c4c2ef98

require 'nokogiri'
require 'open-uri'
require 'csv'

=begin
url = 'https://qiita.com/search?q=ruby'

puts '==== html ===='
fd = URI.open(url)
html = fd.read
puts html

puts ' ==== charset ===='
# fd = URI.open(url)
charset = fd.charset
puts charset

puts '==== url ===='
# fd = URI.open(url)
uri = fd.base_uri
puts uri
=end

url = 'https://qiita.com/search?q=ruby'
fd = URI.open(url)
charset = fd.charset
html = fd.read
File.open('result_html.txt', 'w', encoding: 'utf-8:cp932'){_1.puts html}

__END__
doc = Nokogiri::HTML.parse(html, nil, charset)

path = '//h1[@class="searchResult_itemTitle"]'
titles = doc.xpath(path).map {|node| node.css('a').inner_text}
CSV.open("title.csv", "w", encoding: 'cp932') {|csv| csv << titles}


