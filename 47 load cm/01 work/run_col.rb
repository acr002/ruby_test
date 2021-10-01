# coding: windows-31j


# a = 'cmS0100*問１．都道府県１２３４５６７８９０１２３４５６７８９０* S02'.encode('UTF-8')
a = 'cmS0100*問１．都道府県１２３４５６７８９０１２３４５６７８９０* S02'.encode('windows-31j')

b = a[2, 3].encode('UTF-8')
c = a[8, 27].encode('UTF-8')
d = a[15, 8].encode('UTF-8')
p a, b, c, d

p a.size
################################

require 'nkf'

a = 'cmS0100*問１　都道府県　　　　　　　　　　　　　　　　　　　　* S02'
a2 = a.encode('utf-8')
b = a.byteslice(2, 3).encode('utf-8')
c = a.byteslice(8, 54).encode('utf-8')

p a2, b, c
puts '-' * 32

# e = c.gsub('　'.encode('utf-8'), '')
e = NKF.nkf('-w -Z1', c)
# p "[#{e.gsub(/\s+$/, '')}]"
p "[#{e.strip}]"
################################

h = Hash.new
h[:select] = Hash.new
h[:select][1] = 'test1'
h[:select][2] = 'test2'

p h
h[:select].each do |k, v|
  p k, v
end
p '-' * 24
################################

p Encoding.default_external
################################

a = 'テスト'.encode('utf-8')
p a
p a.encode('utf-8')
p a.encoding
################################

# 2020.12.22(火)
a = 'test.cm'
b = File.basename(a, '.cm')
c = File.basename(a, '.*')
p a, b, c
################################

a = Dir.glob('*')
p a
p a[0]
b = File.basename(a[0], '.*')
p b + '.apf'
################################





