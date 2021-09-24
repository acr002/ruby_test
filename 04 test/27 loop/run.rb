
a = [1, 2, 3, 4]
b = %w(a b c)
c = %w(x y z a1 a2)

loop do
  p a.next
  p b.next
  p c.next
end
