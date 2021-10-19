
ol = Array.new(9).map{' ' * 20}
pp ol
ol[1][0, 5] = 'testA'
ol[3][10, 5] = 'testB'
pp ol
################################

a = 'Q01_test_data'.split('_')
p a
size = 2
b = a.map do |e|
  x = e.chars
  x.each_slice(size).map(&:join)
  # p x
  # x.each_slice(size)
end
pp b.flatten!
p b.size
################################

def sept_chars_size(buf, size)
  a = buf.split('_')
  result = a.map do |e|
    x = e.chars
    x.each_slice(size).map(&:join)
  end
  result.flatten
end
a = 'Q1_A_01_01_gender'
b = sept_chars_size(a, 2)
p b
c = sept_chars_size(a, 4)
p c
################################






