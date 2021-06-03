
require './elements.rb'

class Values
  def self.set(a)
    @h = {}
    a.each do |e|
      @h[e.key] = e
    end
  end

  def self.hv(a)
    # p a
    if @h.include?(a)
      @h[a].value
    else
      p "Values#hv: not found key [#{a}]"
      []
    end
  end
end

def method_arg(a)
  if a.match?(/\(/)
    pat = /([^\(]+)\(([^\)]+)\)/
    b, c = a.scan(pat).flatten
    if c.nil?
      ar = []
    else
      ar = load_arg(c)
    end
    [b, ar]
  else
    [a, []]
  end
end

# varliableが必要かも。
# 指定された引数は、実数、range、変数、定数が複数項目記述される可能性があります。
def load_arg(arg)
  ar = []
  a = arg.split
  a.each do |b|
    if b.include?('..')
      c = b.split('..')
      ar.concat(Range.new(c.first, c.last).to_a.map(&:to_i))
    else
      if b.match?(/\A[0-9]+\z/)
        ar << b.to_i
      else
        ar.concat(Values.hv(b))
      end
    end
  end
  ar.uniq
end

a = []
a << Receiver.new.tap do |e|
  e.key = 'S01'
  e.value = [1]
end
a << Receiver.new.tap do |e|
  e.key = 'S02'
  e.value = [18]
end
Values.set(a)
# a.each{p _1}

# a = '3 4..6 S01'
# a = '3 4..6 S03'
a = '3 4..6 S01 S02'
p load_arg(a)

# p Values.hv('S01')

