
def test(**h)
  a = []
  h.each do |k, v|
    a << "#{k}: #{v}"
  end
  a.join(', ')
end

h = {a: 1, b: 2, c: 'test'}
p h

a = test(**h)
p a

b = test(d: 3, e: 4)
p b
################################

