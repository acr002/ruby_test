
class String
  def midre(x, size, buf)
    # if self.size < x
    #   puts 'error [out of string]'
    # end
    a = buf[0, size]
    self[x, size] = a.ljust(size)
  end

  def midre_l(x, size, buf)
    a = buf[0, size]
    self[x, size] = a.rjust(size)
  end
end

a = '123456789012345678901234567890'
# a[10, 5] = 'test'
ar = []
ar << 'test data'
ar << ''
ar << '  '
ar << 'fuck'
ar << '12'
ar << 'ruby, rails is very fun!'
max = ar.map{_1.size}.max + 2


# 以下のmapを使ってもok
# ar.map{a.midre(10, 6, _1)}
# ar.map do |e|
#   a.midre(10, 6, e)
#   p a
# end

ar.each do |buf|
  # a.midre(10, 6, buf)
  a.midre(10, buf.size, buf)
  puts "#{buf.ljust(max)}: #{a}"
end

p a
p a.size





