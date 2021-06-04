
require 'pp'

# parameter�t�@�C����ǂݍ���ŁAfc hash��Ԃ��܂��B

# load(parameter)
def load_parameter
  fc = []
  para_fns = Dir.glob('para*.txt')
  para_fns.each do |fn|
    File.foreach(fn) do |line|
      next if line.empty?
      next if line[0] == '#'
      next if line.strip.empty?
      blocks = line.split(',')
      fc << load_blocks(blocks)
    end
  end
  fc
end

def load_blocks(blocks)
  blocks.map do |block|
    a = block.split
    case a.first
    when 'if'
      type = :if
      a.delete('if')
    when 'unless'
      type = :unless
      a.delete('unless')
    when 'log'
      type = :log
      a.delete('log')
    else
      type = :do
    end
    h = {}
    h[:type] = type
    h[:method_base] = a.join(' ')
    a = load_method(h[:method_base])
    h[:receiver] = a.shift
    h[:methods] = a
    h
  end
end

def load_method(base)
  a = base.split('.').map(&:strip)
  a.map do |e|
    sep_method_arg(e)
  end
end

def sep_method_arg(arg)
  if arg.match?(/\(/)
    pat = /([^\(]+)\(([^\)]+)\)/
    b, c = arg.scan(pat).flatten
    arct, var = load_arg(c)
  else
    b = arg
    arct = []
    var = []
  end
  h = {}
  h[:method] = b.to_s.strip.downcase
  h[:arct] = arct
  h[:arg_var] = var
  h
end

# �����̓��A�����̂��̂�to_f
# ������Integer(float)��String����
def load_arg(arg)
  return [[], []] if arg.nil?
  a = arg.split
  ar = []
  var = []
  a.each do |b|
    if b.include?('~')
      c = b.split('~')
      ar.concat(Range.new(c.first, c.last).to_a.map(&:to_f))
    else
      if b.match?(/\A[0-9]+\z/)
        ar << b.to_f
      else
        var << b
      end
    end
  end
  [ar, var]
end

fc = load_parameter
pp fc
__END__
a = 'A.add(S01), if S02.include?(1~3), unless S01.include?(1), F01.add(1), log 01 flag'
h = load_blocks(a.split(','))
p a
p h.class
puts h


'if M01.include?(1), CT1(R01).table(table01)'




