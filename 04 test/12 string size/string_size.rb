
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

# text�t�@�C���̃T�C�Y�ɂ͉��s���܂܂��悤�ł��B
# gsub�ŉ��s�������Ă���size�𑪂��Ă������悤�ł��B
# �s����c�����������split������̂������Ǝv���܂��B

# a = File.read('test.txt').split(/\R/)
buf = File.read('test.txt')
p buf.size
p "chomp: #{buf.chomp.size}"
p "gsub: #{buf.gsub(/\R/, '').size}"
p "delete: #{buf.delete("\R").size}"
a = buf.split(/\R/)
p a
p "count: #{a.size}"
p a.max_size
p a.all_count


