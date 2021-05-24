
hr = '-' * 24
a = 'xbbb-xbbb-abbb'
b = /x/
p a, b
p hr
# p a.gsub(b){|e| "a#{e}c" }
# p a.gsub(b){"<p>#{_1}</p>"}
# p a.gsub(b){|e| "<p>#{e}</p>"}

c = a.gsub(b) do |e|
  'y'
end
p c

# b = /(\w+)/
#=> "<p>xbbb</p>-<p>xbbb</p>-<p>abbb</p>"
# b = /(\w+)?/
#=> "<p>xbbb</p><p></p>-<p>xbbb</p><p></p>-<p>abbb</p><p></p>"
################################

