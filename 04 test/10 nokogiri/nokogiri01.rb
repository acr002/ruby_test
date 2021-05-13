
require 'nokogiri'
require 'open-uri'

# 対象のURL
url = "https://www.sejuku.net/blog/"

# NokogiriでURLの情報を取得する
# contents = Nokogiri::HTML(open(url),nil,"utf-8")
contents = Nokogiri::HTML(open(url))

puts contents

__END__
require 'nokogiri'
require 'open-uri'

url = "https://www.sejuku.net/blog/"
contents = Nokogiri::HTML(open(url), nil, "utf-8")
puts contents

