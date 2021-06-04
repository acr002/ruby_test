
require 'pp'
# parameterファイルを読み込んで、fc hashを返します。
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
  h[:body] = b.to_s.strip.downcase
  h[:arct] = arct
  h[:var] = var
  h
end

# 引数の内、数字のものはto_f
# 引数がInteger(float)かStringかで
def load_arg(arg)
  return [[], []] if arg.nil?
  a = arg.split
  ar = []
  var = []
  a.each do |b|
    # a~zのaとzはそれぞれ整数のみ対応
    # 配列の中にRangeオブジェクトを入れるのは可能。。。
    if b.include?('~')
      c = b.split('~')
      ar.concat(Range.new(c.first, c.last).to_a.map(&:to_i))
    else
      if b.match?(/\A\d/)
        if b.match?(/_/)
          ar << b.gsub('_', '.').to_f
        else
          ar << b.to_i
        end
      else
        var << b
      end
    end
  end
  [ar, var]
end

fc = load_parameter
File.open('result.txt', 'w') do |f|
  f.puts fc.pretty_inspect
end
# pp fc




