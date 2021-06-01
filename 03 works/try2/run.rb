

def call_method(receiver, method, arg)
  a = arg.to_i
  case method
  when 'include?'
    receiver.include?(a)
  when 'add'
    receiver << a
  when 'delete'
    receiver.delete(a)
  when 'clear'
    receiver.clear
  when '+', 'calc+'
    [receiver.first + arg]
  when '-', 'calc-'
    [receiver.first - arg]
  when '*', 'calc*'
    [receiver.first * arg]
  end
end

def method_arg(a)
  pat = /([^\(]+)\(([^\)]+)\)/
  b, c = a.scan(pat).flatten
  if c.include?('..')
    ran = c.split('..')
    ar = Range.new(ran.first, ran.last).to_a
  end
  if c.include?(' ')
    ar = c.split.map(&:to_i)
  end
end
################################

a = "S02.add(2).add(1).include?(1)".split('.')
p a
receiver = a.shift
receiver = [3]
cn = 0
a.each do |meth|
  cn += 1
  method, arg = method_arg(meth)
  # p method, arg
  receiver = call_method(receiver, method, arg)
  p "#{cn} #{receiver}"
end





