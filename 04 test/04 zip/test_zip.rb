
a = %w(1 2 3 4 5).map(&:to_i)
b = %w(a b c d e f)
c = %w(z y x)

p a.zip(b).join
p a.zip(b, c).join
p a.zip(b)

