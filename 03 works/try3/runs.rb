

a = 1.2
b = 1.0
c = a - b
p a, b, c
################################

a, b = 10.0, 6.0
c = a / b
p a, b, c
################################

require 'bigdecimal'
require 'bigdecimal/util'

# to_dを使うにはrequire 'bigdecimal/util'が必要なようです。
# a = BigDecimal('1.2') - 1
a = '1.2'.to_d - 1
b = 1.2 - 1
p a, b
################################

# Rationalを使った例(to_r)
a = '1.2'.to_r
b = 1
c = a - b
p a, b, c, c.to_f
################################

# all?, any?
class Array
  def include_any?(a)
    a.any?{self.include?(_1)}
  end

  def include_all?(a)
    a.all?{self.include?(_1)}
  end
end

# all?
# none?
# any?
# one?

a = [1, 3, 7]
# b = [2, 7]
b = [1, 3]
p a.include_all?(b)
# p a.include_all?(1)
# p a.include_any?(b)
p a.include_any?(b)
################################

# shift のテスト
# 右辺で使っても可能。左から実行していくようです。
a = [1, 3, 7]
b = [a.shift, a]
p a, b
################################

# nilにeachすると落ちます。
a = nil
a.each do |e|
  p e
end
################################

# 内部の数値は小数で持つか、整数で持つか。
a = 1
b = 1.0
p a == b
################################

a = '1'.to_f
p a
################################

a = [1, 2, 3]
b, c = a
p b, c
#=> b = 1
#=> c = 2
b, *c = a
p b, c
#=> b = 1
#=> c = [2, 3]
################################

# 配列と配列を結合するテスト
a = [1, 3, 5]
b = [2, 8]
c = a + b
p c
################################

a = [1, 3, 5]
b = a.dup
b.concat([2, 8])
p a, b
################################

# hashにないものを参照した場合
# nilが返ります。hashに要素が追加されたりはしません。
h = {a: 1, b: 3}
a = h[:c]
p a, h
################################

# Hash内の値を変更し、変更した値を返します。
def return_test(h, key, value)
  h[key] = [value]
end
h = {a: 1, b: 3}
p h
a = return_test(h, :a, 2)
p h, a
################################
















