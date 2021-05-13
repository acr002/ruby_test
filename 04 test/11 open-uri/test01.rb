
require 'open-uri'

url = 'https://qiita.com/tearoom6/items/8d3cb67a1bc4e454e989'
# OpenURI.open_uri(url) do |file|
open(url) do |file|
  p file.read
end

