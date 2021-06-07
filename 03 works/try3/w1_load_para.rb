#-----------------------------------------------------------[date: 2021.06.07]

require 'pp'
# parameterファイルを読み込んで、fc hashを返します。
# load(parameter)
def load_parameter
  fc = []
  para_fns = Dir.glob('para*.txt')
  para_fns.each do |fn|
    puts "load file: #{fn}"
    cn = 0
    File.foreach(fn) do |line|
      next if line.empty?
      next if line[0] == '#'
      next if line.strip.empty?
      cn = cn + 1
      blocks = line.split(',')
      fc << load_blocks(blocks)
    end
    puts "count: #{cn} blocks"
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
  # h[:body] = b.to_s.strip.downcase
  h[:body] = b.to_s.strip
  h[:arct] = arct
  h[:var] = var
  h
end

# 数値の中で、_(小数を表す)が含まれていたらFloat、
# それ以外の数字はIntegerにします。
# 文字列は全てvarととらえてStringで保持します。
# arctには数値のみ、varは文字列のみ格納します。
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




