# coding: cp932

# require 'pry-byebug'
require 'pry'

# 2021.04.20(��)
# line�����H���Ă����A���ʂ��o�͂���K�v������܂��B
# ����line�����H���Ă���gc.map!�ł������ł����A�V�����z��ɑ}�����Ă��������ł������Ǝv���܂��B
# result = gc.map{} �ł������Ǝv���܂��B
a = %w(q b c d e f g a)
binding.pry
b = a.map do |e|
  unless e == 'e'
    'test'
  else
    e
  end
end
p a, b
################################

def sf(*a)
  a.map(&:to_s).join(' ')
end

a = 'test'
b = 3
c = {a: 3, b: 1}
p sf(a, b, c, nil)
################################

n = 2
a = 'test data'
b = a.rjust(n)[0, n]
c = a.ljust(n)[0, n]
p a, b, c
################################

class NewString < String
  def initialize(buf)
    self.replace buf
  end
end
a = NewString.new('test data')
p a
################################

class Hash
  def x(apf, *a)
    a.each do |e|
      self[e] = apf[e]
    end
    self
  end
end

h = {}
apf = {a: [1, 2], b: [1, 3], c: [1, 4]}
h.x(apf, :a, :b)
p h
################################

