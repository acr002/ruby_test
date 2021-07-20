
require 'nokogiri'
require 'open-uri'
require 'csv'

# タグごとに改行してXML記法にする。
doc = Nokogiri::HTML.parse(fd, nil, charset)
path = '//h1[@class="searchResult_itemTitle"]'
titles = doc.xpath(path).map{|node| node.css('a').inner_text}
CSV.open('title.csv', 'w'){|csv| csv << titles}

# doc.xpath(path).each do |node|
#   puts node
#   p node.css('a').inner_text
# end



url = 'https://qiita.com/search?q=ruby'
charset = nil
html = URI.open(url) do |f|
  charset = f.charset
  f.read
end
doc = Nokogiri::HTML.parse(html, nil, charset)




