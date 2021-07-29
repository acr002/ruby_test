

def test
  a = 1.step
  p a.class
  a
end


5.times do
  x = test.next
  a, b = x.next, x.next
  p [a, b]
end




