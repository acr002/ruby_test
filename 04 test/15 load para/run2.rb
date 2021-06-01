
def call_method(receiver, method, arg)
  # a = arg.to_i
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
  # c = [] if c.nil?
  ar = []
  if c.match?(/[0-9]+/)
    ar << c.to_i
  end
  if c.include?('..')
    ran = c.split('..')
    ar = Range.new(ran.first, ran.last).to_a
  end
  if c.include?(' ')
    ar = c.split.map(&:to_i)
  end
  [b, ar]
end

# a = 'S01.+(1).*(10).-(3).table(table01)'.split('.')
a = 'S01.+(1).*(10).-(3)'.split('.')
receiver = a.shift
receiver = [5]
a.each do |e|
  method, arg = method_arg(e)
  receiver = call_method(receiver, method, arg)
end
p receiver
################################

