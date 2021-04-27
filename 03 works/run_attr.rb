
class Hoge
  attr_accessor :key, :value
  def initialize(*a)
    @cn = 0
    @value = a
  end

  def count
    @cn
  end

  def retouch(*a)
    @cn += 1
    @value = a
  end

  def add(*a)
    base = @value.dup
    base << a
    retouch(base.flatten.uniq.sort)
  end
end

a = Hoge.new(1, 3)
p a
a.add(2, 5)
p a



__END__
a.value = 'test'
p a.value
p a.value
p a.count

