
a = 'abccdefg'
p a
p a.gsub(/def/, '!!')
################################

a = 'xbbb-xbbb-abbb'
b = /(b+)/
# c = "#{$1}"
p a, b
# p a.gsub(b){|e| "a#{e}c" }
p a.gsub(b){ "ac" }
################################
















