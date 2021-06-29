


# https://qiita.com/weedslayer/items/b3773e6573b35a778d8d
# 上記サイトのコメントより

require "open-uri"
require "nokogiri"

html = open("http://shopping.yahoo.co.jp/category/2510/2327/45931/45933/stores/")
doc = Nokogiri::HTML(html)
doc.search(".mdStoreList div.elItem > ul > li").each do |element|
  p [element.at("a.elStore")["href"], element.at("span.elStoreName").inner_text]
end

