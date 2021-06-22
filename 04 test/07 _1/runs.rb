
# 2021.05.11(火)
# _1～_9はブロック変数として使用できます。
# ネストされたブロックでは指定ができませんでした。
a = %w(a b c d e f)
b = %w(1 2 3 4 5 6)
a.each do |e|
  b.each do
    p "#{e} #{_1}"
  end
end
################################

a = %w(a b c d e f)
b = %w(1 2 3 4 5 6)
c = a.zip(b).map(&:join)
p c
################################

a = %w(a b c d e f)
b = %w(1 2 3 4 5 6)
c = [*1..9]
z = a.zip(b, c).map(&:join)
p z
################################

a = %w(a b c d e f).each
b = %w(1 2 3 4 5 6).each
c = [*1..9].each
loop do
  p "#{a.next} #{b.next} #{c.next}"
end
################################

a = %w(a,1 b,2 c,3 d,4)
h = {}
a.each do
  # p _1.split(',')
  b = _1.split(',')
  h[b.first] = b.last
end
p h
################################

a = %w(a b c d e f)
b = %w(1 2 3 4 5 6)
c = [*1..9]
z = a.zip(b, c)
z.each do
  p _1.join(', ')
end
################################

a = %w(1 2 3 4 5 6 7 8 9 a b c d e)
b = a.map do
  if _1.match?(/\d/)
    _1.to_i
  else
    999
  end
end
p a, b
################################










