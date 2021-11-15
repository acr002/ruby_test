
#
a = '012345678901234567890'
p a
range = 5
a[2, range] = 'xxx'.ljust(range)
p a
################################


#
class Array
  def include_all?(list)
    include_works(list).all?
  end

  def include_any?(list)
    include_works(list).any?
  end

  def include_true_count(list)
    h = include_works(list).tally
    h[true]
  end

  def include_works(list)
    ar_flag = []
    list.each do |e|
      ar_flag << self.include?(e)
    end
    ar_flag
  end
end

hr = '-' * 32
# a = [2, 5, 8, 9, 10]
a = [5]
# b = [1, 2, 3]
# b = [2, 3]
# b = [1, 2, 3, 5, 10, 9]
b = [1, 2, 3]
p a, b
# p a.include_all?(b)
p a.include_any?(b)
# p hr
# p a.include_true_count(b)
################################

# to_iのテスト
# 数字の間にスペースがある場合はスペースを消さないとスペースの前までしか数値化しません。
a = ''
p [a, a.to_i]
a = nil
p [a, a.to_i]
a = '1'
p [a, a.to_i]
a = ' 1   2 '
p [a, a.to_i]
p [a, a.gsub(' ', '').to_i]
################################







