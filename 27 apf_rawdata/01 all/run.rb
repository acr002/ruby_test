

# Hash のループで、自身以外をすべて回す。
h = {S01: 1, S02: 2, S03: nil, S04: 2}
p h

h.each do |k, v|
  a = h.clone
  a.delete(k)
  a.each do |ak, av|
    p [ak, av]
  end
  puts '8' * 24
end
################################
