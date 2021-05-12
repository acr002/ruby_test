hr = '-' * 32
a = 2
b = if a.nil? then 'none' else a end
p a, b
p hr
c = a.nil? ? 'none' : a
p a, c
################################


a = 0
if a.zero?
  b = 'zero'
else
  b = a
end
p b
#-------------------------------

a = 0
b = if a.zero? then 'zero' else a end
p b
#-------------------------------

a = 1
b = a.zero? ? 'zero' : a
p b
################################


a = 1
b = 'test'
p a == b
################################

