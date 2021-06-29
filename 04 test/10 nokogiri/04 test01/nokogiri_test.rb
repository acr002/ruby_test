
require 'nokogiri'
require 'open-uri'
require 'pp'

def setup_doc(url)
  fd = URI.open(url)
  charset = fd.charset
  html = fd.read
  doc = Nokogiri::HTML.parse(html, nil, charset)
  doc.search('br').each{|n| n.replace("\n")}
  doc
end

hr = '-' * 36
url = 'https://qiita.com/search?q=ruby'
doc = setup_doc(url)
doc.xpath('//h1[@class="searchResult_itemTitle"]').each do |node|
  p node.css('a').inner_text
  # p node.at_css('a')[:href]
  a = node.css('a').first[:href]
  p URI.join(url, a).to_s
  p hr
end
