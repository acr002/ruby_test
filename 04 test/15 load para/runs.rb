
line = File.read('para.txt', encoding: 'cp932:utf-8').split(/\R/)
para = []
line.each do |eline|
  block = eline.split(',').map(&:strip)
  block.each do |eblock|
    # p eblock
    # "if S01.include?(1)"
    # "unless S01.include?(1)"
    # "set S01(1)"
    sect = eblock.split
    # p sect
    # ["if", "S01.include?(1)"]
    # ["unless", "S01.include?(1)"]
    # ["set", "S01(1)"]
    h = {}
    h[:type] = sect.first
    h[:para] = sect[1..nil]
    p h
    # {:type=>"if", :para=>["S01.include?(1)"]}
    # {:type=>"unless", :para=>["S01.include?(1)"]}
    # {:type=>"set", :para=>["S01(1)"]}
  end
end
################################

p [1, 2, 3, 4][2..-1]
p [1, 2, 3, 4][2..nil]
p [1, 2, 3, 4][2..]
################################

a = "if s01.include?(1), if s02.include?(1)".split(',')
p a[1].split
# ["if", "s02.include?(1)"]
################################

a = "        a  b c ".split
p a
# ["a", "b", "c"]
################################

a = 'include?(2).value(3)'
b = a.match(/([^\(]+)\(([^\)]+)\)/)
p a, b, *b
################################

a = 'include?(2).value(3)'
b = a.scan(/([^\(]+)\(([^\)]+)\)/)
p a, b
b.each do |e|
  p e
end
################################

pat = /([^\(]+)\(([^\)]+)\)/
a = 'include?(2).value(3)'.split('.')
a.each do |b|
  c = b.scan(pat).flatten
  p "#{c.first}: [#{c[1]}]"
end
################################

# メソッドチェーンにおいて、レシーバとメソッドを分けます。
# Hashに格納し、keyにレシーバを入れ、valueに配列にしたメソッドを入れています。
pat = /([^\(]+)\(([^\)]+)\)/
a = 'a(s01).include?(2).value(3)'
els = a.split('.')
h = {}
t = els.shift
h[t] = els
p h
################################

# メソッド名と引数を分割します。
def method_arg(a)
  pat = /([^\(]+)\(([^\)]+)\)/
  a.scan(pat).flatten
end

a = 'a(s01).include?(2).value(3)'
els = a.split('.')
h = {}
els.each do |e|
  a = method_arg(e)
  h[a.first] = a[1]
end
p h
################################

# Array#delete  !はいりません。破壊的メソッドです。
h = {s01: [1, nil, 2, nil, 3, nil, 5]}
p h
h[:s01].delete(2)
p h
h[:s01].delete(nil)
p h
################################

a = %w(if MUST S02.include?(2))
p a
p a.map(&:downcase).include?('must')

b = %w(do s01.delete(1))
p b
p b.include?('must')
################################

# String > Range > Array
a = '2..4'
b = a.split('..').map(&:to_i)
c = Range.new(b.first, b.last)
ar = c.to_a
p a, b, c, ar
################################

# argsの区切りはどうすべきか。
# 下記はアンスコ(_)の例。
c = '1_3_8'
if c.include?('_')
  ar = c.split('_').map(&:to_i)
  p ar
end
################################

# typeとmustとmethodを分割します。
def analysis_block(buf)
  h = {}
  a = buf.split
  h[:type] = a.shift
  if a.map(&:downcase).include?('must')
    h[:must] = true
    a.delete('must')
  end
  h[:method] = a.join(' ')
  h
end

# a = 'if must S02.include?(1 2 3)'
# a = 'if  S02.include?(1 2 3) must'
a = 'if  S02.include?(1 2 3)'
h = analysis_block(a)
p h
if h[:must]
  p 'must!!'
else
  p 'not must'
end
################################









