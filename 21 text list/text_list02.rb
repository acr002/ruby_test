
require 'pp'

def space(n = 1)
  ' ' * n
end

def max_size(list)
  list.map{|e| e.encode('cp932').bytesize}.max
end

def file_split_transpose(path)
  File.read(path, encoding: 'cp932:utf-8')
    .split(/\R/)
    .map{_1.split(/\t/)}
    .transpose
end

def file_put(path, ar)
  File.open(path, 'w', encoding: 'cp932') do |f|
    f.puts ar
  end
end

def text_format(id, buf, size)
  empty_size = size - buf.encode('cp932').bytesize
  "#{id.to_s.rjust(3, '0')}. #{buf}#{space * empty_size}"
end

class Array
  def all_size
    self.map{_1.size}.sum
  end

  def map_ljust(max_size)
    cn = 0
    self.map do |e|
      a = e.map do |buf|
        cn += 1
        text_format(cn, buf, max_size)
      end
      a.join(space(2))
    end
  end

  def sep_h(cols, ms)
    self.each_slice(cols).to_a.map_ljust(ms)
  end
end

list = file_split_transpose('list02.txt')
# pp list

# p max_size(list[0])
# p max_size(list[1])

ms = max_size(list[0])
cols = 78.div(ms)

# a = list[0].sep_h(cols, ms)
a = list[0].sep_h(3, ms)
file_put('result02_h.txt', a)

