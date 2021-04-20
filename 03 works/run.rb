
# 2021.04.20(火)
# lineを加工していき、結果を出力する必要があります。
# 元のlineを加工していくgc.map!でもいいですし、新しい配列に挿入していくやり方でもいいと思います。
# result = gc.map{} でもいいと思います。
a = %w(q b c d e f g a)
b = a.map do |e|
  unless e == 'e'
    'test'
  else
    e
  end
end
p a, b
################################


