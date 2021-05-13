
# https://qiita.com/seiya1121/items/3dde2dae7319fe261323

require 'open-uri'
require 'nokogiri'

url = 'http://curazy.com/archives/6493'

carset = nil
html = open(url) do |f|
  carset = f.charset
  f.read
end

page = Nokogiri::HTML.parse(html, nil, charset)
shuzo_meigen = page.search('pre')
p shuzo_meigen.text

