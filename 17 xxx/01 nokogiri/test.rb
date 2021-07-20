
require 'nokogiri'
require 'open-uri'
require 'pp'

url = 'https://rooter.jp/web-crowing/xpath-ruby/'
charset = nil
html = URI.open(url) do |a|
  charset = a.charset
  a.read
end
doc = Nokogiri::HTML.parse(html, nil, charset)
# pp doc

ar = []
doc.search('a').each do |e|
  p e
  unless e.attributes['name'].nil?
    if e.attributes['name'].value.first_with?('http')
      ar << e
    end
  end

  # ar << e
  # pp e
  # e.attributes['name'].value if e.attributes['name']
end
p ar

# File.open('result_a.txt', 'w') do |f|
#   ar.each do |e|
#     f.puts e
#   end
# end


