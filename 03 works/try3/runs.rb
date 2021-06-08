

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

a = [1, 3, 5, 3, 1]
b = a.uniq
p a, b
################################

# concatは破壊的に連結を行います。=の右辺でも同様です。
a = [1, 3]
b = [2]
c = []
d = a.concat(b)
e = a.concat(c)
p a, b, c, d, e
################################

# Array#+は複数つなげることができます。concatの引数を複数にすることも可能です。
a = [1, 2]
b = [3, 4]
c = [5, 6]
d = a + b + c
p d
p a
a.concat(b, c)
p a
################################

# Arrayが空かどうかを確認します。
# ただの空なら.empty?で判定できます。
# もし、空文字列も空に含めるのであれば、空文字列をnilにし、compact!を使ってください。
a = ['']
b = a.map{nil if _1.empty?}.compact
# a.map! do |e|
#   if e.empty?
#     nil
#   end
# end
# b = a.compact
p b.empty?
p a, b
################################

class Array
  def include_any?(b)
    b.any? do |e|
      self.include?(e)
    end
  end
end
# any? すべての要素が偽である場合にfalseを返します。ひとつでも真があればただちにtrueを返します。
a = [1, 3, 5, 6, 8]
b = [2, 4, 8]
# p a.include?(*b)
# c = b.any? do |e|
#   a.include?(e)
# end
# p c
p a.include_any?(b)
################################

# Array#-は破壊的ではありません。
# 基準(レシーバ(左にあるもの))を元に新たな配列を作ります。
a = [1, 3, 5]
b = [2, 5]
p a - b
p b - a
p a, b
################################

def other?(ar, a)
  !((ar - a).empty?)
end
a = [1, 3, 5]
b = [3, 5]
c = [1, 3, 5]
p other?(a, b)
p other?(a, c)
################################










