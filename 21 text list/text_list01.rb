# coding: cp932

# 全角文字を含む文字列を整形してテキストで出力します。
# 対象は二次元配列に格納されている配列です。

# utf-8では全角文字は3バイトになるようなので、全角=2にするには
#   buf.bytesize == 1 ? 1 : 2
# のようにするそうですが、cp932だと全角文字が2バイトになるのでそのまま使用しました。

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
  # 最大文字数を取得する
  # listは二次元配列なので、まず行で回して、各列の最大文字数を求めます。
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

# key = '田'.encode('utf-8')
# result = seach_key(list, key)
# p result
a = puts_list(list)
puts a
File.open('result.txt', 'w', encoding: 'cp932') do |f|
  f.puts a
end





