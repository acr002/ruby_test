


a = %w(a,1 b,2 c,3 d,4)
h = {}
a.each do
  b = _1.split(',')
  h[b.first] = b.last
end
p h
################################


