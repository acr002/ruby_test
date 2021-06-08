

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
















