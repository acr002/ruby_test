
require 'google-search'

# Google::Search::Web.new(:query => 'ruby').each do |item|
#   p item.url
#   p item.title
# end

a = Google::Search::Web.new(:query => 'ruby')
p a
a.each do |e|
  p e.url
  p e.title
end

