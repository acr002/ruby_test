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




