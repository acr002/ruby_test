# coding: cp932

p 'a'.size
p '��'.bytesize
p '����'.bytesize
p '�E�� �o��'.bytesize
################################

20.times do |i|
  puts rand(1000).to_s.rjust(4, '0')
end
################################

# ruby�ł͐��� �� �����͐����ŕԂ�܂��B
# �����ɂ���ꍇ�́A�ǂꂩ�ɏ����_�����邩fdiv���g���܂��B
a = 78 / 21
p a
a = 78.div(36)
p a
################################

# each_slice���Ԃ��̂�Enumerable��Ԃ��̂�.to_a��������Array�ɂ��Ă����܂��B
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



