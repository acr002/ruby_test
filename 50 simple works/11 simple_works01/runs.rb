
class Array
  def to_buf(width = 1, padding = '0')
    self.map{_1.to_s.rjust(width, padding)}.join
  end
end
ar = [1, 3, 5, 999]
p ar.to_buf(2, ' ')
p ar.to_buf(2)
p ar.to_buf
p ar
################################

# 作成したArrayを複数個所に格納する場合、
# すべて同一オブジェクトを参照してしまうので、
# dupなどを使用して別のオブジェクトにする必要があります。
h = {}
a = (1..9).to_a
h[:ar] = a.dup
# h[:ar] = a
h[:base] = a
h[:ar].map!{_1 + 10}
pp h
################################

# dupの場合は浅いコピーになります。
# もう一次元深くするなら b = a.map(&:dup) を使います。
a = [[1, 2], [3, 4]]
b = a
s = a.dup
d = a.map(&:dup)
pp a, b, s, d
a[0][0] = 'test'
pp a, b, s, d
################################

# dupの場合は浅いコピーになります。
# もう一次元深くするなら b = a.map(&:dup) を使います。
a = [[1, 2], [3, 4]]
b = a
s = a.dup
d = a.map(&:dup)
pp a, b, s, d
a[0][0] = 'test'
pp a, b, s, d
################################

# Stringでのempty?の確認
# 文字長さzeroの場合、empty?はtrueになります。
# スペースだけではfalseになります。
a = ' '
p a.empty?
################################

# String#to_iの確認
# 文字長さzeroをto_iするとzero
# スペースをto_iしてもzero
# ' 12 'をto_iすると12
# ' 1 2 'をto_iすると1です。
# 間のスペースを消すのであればgsubなどを使用します。
a = ' 1 2 '.gsub(' ', '')
p [a, a.to_i]
################################

# 文字列の右側から取得する
a = '12345'
range = 2
r = a.size - range
r = 0 if r.negative?
p a[r..-1]
# p a[-9..-1]
################################


