# coding: cp932

# �S�p�������܂ޕ�����𐮌`���ăe�L�X�g�ŏo�͂��܂��B
# �Ώۂ͓񎟌��z��Ɋi�[����Ă���z��ł��B

# utf-8�ł͑S�p������3�o�C�g�ɂȂ�悤�Ȃ̂ŁA�S�p=2�ɂ���ɂ�
#   buf.bytesize == 1 ? 1 : 2
# �̂悤�ɂ��邻���ł����Acp932���ƑS�p������2�o�C�g�ɂȂ�̂ł��̂܂܎g�p���܂����B

require 'pp'

def seach_key(list, key)
  a = []
  list.each do |e|
    a << e if e.first.include?(key)
  end
  a
end

def space(n = 1)
  ' ' * n
end

def puts_list(list)
  # �ő啶�������擾����
  # list�͓񎟌��z��Ȃ̂ŁA�܂��s�ŉ񂵂āA�e��̍ő啶���������߂܂��B
  cch = {}
  list.each do |e|
    e.each_with_index do |x, i|
      cch[i] ||= 0
      buf = x.encode('cp932')
      cch[i] = buf.bytesize if cch[i] < buf.bytesize
    end
  end
  pp cch
  a = []
  list.each do |e|
    b = []
    e.each_with_index do |x, i|
      # b << x.ljust(cch[i])
      # b << x + (' ' * (cch[i] - x.encode('cp932').bytesize))
      b << "#{x}#{space * (cch[i] - x.encode('cp932').bytesize)}"
    end
    a << b.join('  ')
  end
  a
end

# https://www.techscore.com/blog/2012/12/25/ruby-%E3%81%A7%E3%83%9E%E3%83%AB%E3%83%81%E3%83%90%E3%82%A4%E3%83%88%E6%96%87%E5%AD%97%E3%81%AB%E5%AF%BE%E3%81%97%E3%81%A6-ljust-%E3%81%97%E3%81%A6%E3%82%82%E7%B6%BA%E9%BA%97%E3%81%AB%E6%8F%83/
class String
  def mb_ljust(width, padding = ' ')
    output_width = each_char.map{|c| c.bytesize == 1 ? 1 : 2}.reduce(0, &:+)
    padding_size = [0, width - output_width].max
    self + padding * padding_size
  end
end



list_a = File.read('list02.txt', encoding: 'cp932:utf-8').split(/\R/)
list = list_a.map{_1.split(/\t/)}
# p list

# list.each do |row|
#   row.each do |e|
#     p [e, e.size, e.encode('cp932').bytesize]
#   end
# end

# key = '�c'.encode('utf-8')
# result = seach_key(list, key)
# p result
a = puts_list(list)
puts a
File.open('result.txt', 'w', encoding: 'cp932') do |f|
  f.puts a
end





