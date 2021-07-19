
class Array
  def max_size
    ms = 0
    self.each do |e|
      a = e.size
      ms = a if ms < a
    end
    ms
  end

  def all_count
    self.map(&:size).sum
    # cn = 0
    # self.each do |e|
    #   cn += e.size
    # end
    # cn
  end
end

def info_hash(path)
  buf = File.read(path)
  a = buf.split(/\R/)
  h = {}
  h[:row_size] = a.size
  h[:max_size] = a.max_size
  h[:all_size] = a.all_count
  h
end

# textファイルのサイズには改行も含まれるようです。
# gsubで改行を消してからsizeを測ってもいいようです。
# 行数を把握したければsplitをするのもいいと思います。

# a = File.read('test.txt').split(/\R/)
# buf = File.read('test.txt')
# p buf.size
# p "chomp: #{buf.chomp.size}"
# p "gsub: #{buf.gsub(/\R/, '').size}"
# p "delete: #{buf.delete("\R").size}"
# a = buf.split(/\R/)
# p a
# p "count: #{a.size}"
# p a.max_size
# p a.all_count

h = info_hash('test.txt')
p h


