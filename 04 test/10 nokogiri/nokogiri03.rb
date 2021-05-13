
# https://qiita.com/seiya1121/items/3dde2dae7319fe261323

require 'open-uri'
require 'nokogiri'

url = 'https://curazy.com/archives/6493'

page = Nokogiri::HTML.parse(OpenURI.open_uri(url))
# shuzo_meigen = page.search('p')
# p shuzo_meigen.text

# p page.search('h1').text
# p page.search('h2').text
page.css('h1').each do
  p _1.content
end





__END__
charset = nil
html = OpenURI.open_uri(url) do |f|
  charset = f.charset
  f.read
end

page = Nokogiri::HTML.parse(html, nil, charset)
shuzo_meigen = page.search('pre')
p shuzo_meigen.text

