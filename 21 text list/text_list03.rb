
def space(n = 1)
  ' ' * n
end

# File関係
# Fileから配列にする
def file_split_transpose(path)
  File.read(path, encoding: 'cp932:utf-8')
    .split(/\R/)
    .map{_1.split(/\t/)}
    .transpose
end

def file_put(path, ar)
  File.open(path, 'w', encoding: 'cp932'){|f| f.puts ar}
end
################################

class String
  def text_format(id, size)
    empty_size = size - self.encode('cp932').bytesize
    "#{id.to_s.rjust(2, '0')}. #{self}#{space * empty_size}"
  end
end

# Arrayにメソッドを追加
class Array
  def max_length
    self.map{_1.encode('cp932').bytesize}.max
  end

  def all_size
    self.map{_1.size}.sum
  end

  def map_ljust(max_size)
    cn = 0
    self.map do |e|
      a = e.map do |buf|
        cn += 1
        buf.text_format(cn, max_size)
      end
      a.join(space(2))
    end
  end

  def sep_v(cols, max_size)
    self.each_slice(cols).to_a.map_ljust(max_size)
  end
end
################################

list = file_split_transpose('list02.txt')
max_size = list[0].max_length
file_put('result03_h.txt', list[0].sep_v(3, max_size))

