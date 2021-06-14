

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

# to_d���g���ɂ�require 'bigdecimal/util'���K�v�Ȃ悤�ł��B
# a = BigDecimal('1.2') - 1
a = '1.2'.to_d - 1
b = 1.2 - 1
p a, b
################################

# Rational���g������(to_r)
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

# shift �̃e�X�g
# �E�ӂŎg���Ă��\�B��������s���Ă����悤�ł��B
a = [1, 3, 7]
b = [a.shift, a]
p a, b
################################

# nil��each����Ɨ����܂��B
a = nil
a.each do |e|
  p e
end
################################

# �����̐��l�͏����Ŏ����A�����Ŏ����B
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

# �z��Ɣz�����������e�X�g
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

# hash�ɂȂ����̂��Q�Ƃ����ꍇ
# nil���Ԃ�܂��Bhash�ɗv�f���ǉ����ꂽ��͂��܂���B
h = {a: 1, b: 3}
a = h[:c]
p a, h
################################

# Hash���̒l��ύX���A�ύX�����l��Ԃ��܂��B
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

# concat�͔j��I�ɘA�����s���܂��B=�̉E�ӂł����l�ł��B
a = [1, 3]
b = [2]
c = []
d = a.concat(b)
e = a.concat(c)
p a, b, c, d, e
################################

# Array#+�͕����Ȃ��邱�Ƃ��ł��܂��Bconcat�̈����𕡐��ɂ��邱�Ƃ��\�ł��B
a = [1, 2]
b = [3, 4]
c = [5, 6]
d = a + b + c
p d
p a
a.concat(b, c)
p a
################################

# Array���󂩂ǂ������m�F���܂��B
# �����̋�Ȃ�.empty?�Ŕ���ł��܂��B
# �����A�󕶎������Ɋ܂߂�̂ł���΁A�󕶎����nil�ɂ��Acompact!���g���Ă��������B
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
# any? ���ׂĂ̗v�f���U�ł���ꍇ��false��Ԃ��܂��B�ЂƂł��^������΂�������true��Ԃ��܂��B
a = [1, 3, 5, 6, 8]
b = [2, 4, 8]
# p a.include?(*b)
# c = b.any? do |e|
#   a.include?(e)
# end
# p c
p a.include_any?(b)
################################

# Array#-�͔j��I�ł͂���܂���B
# �(���V�[�o(���ɂ������))�����ɐV���Ȕz������܂��B
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

class Array
  def mrv_delete(arg)
    arg.each do |e|
      self.delete(e)
    end
  end
end
a = [1, 3, 5, 7]
b = [2, 3, 7]
p a, b
a.mrv_delete(b)
p a, b
################################

# ���[�v�̒��̃��[�v���u���C�N������B����͕��ʂɏo���邪�A�ŏ��̃��[�v��map�̏ꍇ�A�����̗p����̂��s���Ȃ��߁A�V�����z��ɓ���邱�Ƃɂ��܂����B
a = [1, 2, 1, 3, 1, 2]
b = {a: 1, b: 2, c: 3, d: 4}
# c = a.map do |e|
#   b.each do |k, v|
#     if v == e
#       k
#       break
#     end
#   end
# end
ar = []
a.each do |e|
  b.each do |k, v|
    if v == e
      ar << k
      break
    end
  end
end
p a, b, ar
################################

# average
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p [a.sum.to_f / a.size]
################################

# �v�f��nil�������Ă����min�Ȃǂ��ł��Ȃ��̂ŁAcompact�����݂܂��B
a = [1, 2, 3, 4, 5, 6, 7, 8, nil, 9, -1, 10]
p a.compact.min
################################

p 5 % 2
################################

# ������̕����u�������̃e�X�g
a = '00000000000000000000'
b = 'test'
si = 5
a[3, si] = b[0, si].ljust(si)
p a
################################

# ������̉E�[�ɃX�y�[�X������
a = '00001  12     '
b = a.ljust(50)
p a, b
p b.size
################################

# buf�T�C�Y�̌v�Z
(98..102).each do |i|
  p "#{i}: #{(((i - 1) / 100) + 1) * 100}"
end
################################

# �߂�l�̊m�F
class Array
  def include_any?(b)
    b.any? do |e|
      self.include?(e)
    end
  end
end
a = [1, 3, 5, 7]
b = [2, 4, 6]
c = a.include_any?(b)
p a, b, c
################################

# String#empty?�̃e�X�g�B��������0�̎�true�ɂȂ�܂��B
a = '  3'
b = a.strip
unless b.empty?
  p b.to_i
else
  p 'empty'
end
p a
p a.strip.empty?
# unless a.nil?
#   unless a.strip.empty?
#     p "not empty [#{a}]"
#   else
#     p "empty [#{a}]"
#   end
# end
################################

z = 'yes'
a = [1, 2, 3, z]
b = [3, 2, 1, z]
p a, b
p 'yes'.to_i
# p a.sort
# p a == b.sort
################################

# ���\�b�h�Ɋi�[����hash��n���Ă����̂��e�X�g
def load_para_test(fc, line)
  unless line.size.zero?
    a = line.split
    if a.size > 1
      fc[a.first] = a[1..nil].join(' ')
    end
  end
end
fc = {}
File.foreach('para_test.txt') do |line|
  load_para_test(fc, line)
end
p fc
################################































