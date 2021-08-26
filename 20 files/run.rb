
def to_hash(ar)
  ar.map{[_1, nil]}.to_h
  # h = {}
  # ar.map{|e| h[e] = nil}
  # h
end

a = %w(a b c d)
p a
b = to_hash(a)
p b
################################




