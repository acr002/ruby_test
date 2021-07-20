
require 'open-uri'
require 'nokogiri'
require 'pp'

def put_file(path = 'result.txt', a)
  File.open(path, 'w') do |f|
    PP.pp(a, f)
    # a.each do |e|
    #   PP.pp(e, f)
    #   # f.puts e
    # end
  end
end

url = 'https://qiita.com/Kenya/items/d1a2325a552d11814111'
=begin
html = URI.open(url)
# put_file('result_html.txt', html)

doc = Nokogiri::HTML.parse(html, nil, 'utf-8')
# put_file('result_doc.txt', doc)

pp doc.search('a')
=end

# charset = nil
# html = URI.open(url) do |f|
#   charset = f.charset
#   f.read
# end
# page = Nokogiri::HTML.parse(html, nil, charset)

page = Nokogiri::HTML.parse(URI.open(url))
put_file('result_sample_parse.txt', page)





