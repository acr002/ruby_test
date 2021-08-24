# coding: cp932

p 'a'.size
p 'あ'.bytesize
p '決意'.bytesize
p '殺す 覚悟'.bytesize
################################

20.times do |i|
  puts rand(1000).to_s.rjust(4, '0')
end
################################

# rubyでは整数 ÷ 整数は整数で返ります。
# 小数にする場合は、どれかに小数点をつけるかfdivを使います。
a = 78 / 21
p a
a = 78.div(36)
p a
################################

# each_sliceが返すのはEnumerableを返すので.to_aをかけてArrayにしてあげます。
a = %w(a b c d e f g)
p a.each_slice(2).to_a
################################

class Array
  def all_size
    self.map{|e| e.size}.sum
    # self.map do |e|
    #   p e
    # end
  end
end
a = %w(a b c d e f g)
b = a.each_slice(2).to_a
p b.all_size
################################



