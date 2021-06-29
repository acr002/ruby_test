

# https://qiita.com/momokahori/items/851e4c36c5b5c4c2ef98
# https://qiita.com/Coolucky/items/5d8e49f2c52c99c7d3c2

require 'nokogiri'
require 'open-uri'
require 'csv'
require 'pp'

def setup_doc(url)
  fd = URI.open(url)
  charset = fd.charset
  html = fd.read
  doc = Nokogiri::HTML.parse(html, nil, charset)
  doc.search('br').each{|n| n.replace("\n")}
  doc
end

url = 'https://qiita.com/search?q=ruby'
doc = setup_doc(url)
p doc.xpath('//a').text
# p doc.xpath('//a').attribute('href').value

# File.open('result_pp.txt', 'w', encoding: 'utf-8:cp932'){_1.puts doc.pretty_inspect}

# p doc.xpath('a').attribute('href').value
# p doc.xpath('div/h1').text
# File.open('result_html.txt', 'w', encoding: 'utf-8:cp932'){_1.puts doc}

__END__
doc = Nokogiri::HTML.parse(html, nil, charset)

path = '//h1[@class="searchResult_itemTitle"]'
titles = doc.xpath(path).map {|node| node.css('a').inner_text}
CSV.open("title.csv", "w", encoding: 'cp932') {|csv| csv << titles}


