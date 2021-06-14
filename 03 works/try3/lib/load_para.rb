#-----------------------------------------------------------[date: 2021.06.14]

# parameterファイルを読み込んで、fc hashを返します。
# load(parameter)
def load_parameter(fc)
  tables = {}
  para = []
  para_fns = Dir.glob('para*.txt')
  para_fns.each do |fn|
    # puts "load file: #{fn}"
    # cn = 0
    File.foreach(fn) do |line|
      a = line.strip
      next if a.empty?
      next if a.start_with?('#', '*')
      if a.start_with?('table')
        load_table(tables, a)
      else
        # cn = cn + 1
        blocks = line.split(',')
        para << load_blocks(blocks)
      end
    end
    # puts "count: #{cn} blocks"
  end
  fc[:para] = para
  fc[:tables] = tables
  # [fc, tables]
end

def load_blocks(blocks)
  blocks.map do |block|
    next if block.strip.start_with?('#')
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
    unless type == :log
      h[:method_base] = a.join(' ')
      a = load_method(h[:method_base])
      h[:receiver] = a.shift
      h[:methods] = a
    else
      h[:log_title] = a.join(' ')
    end
    h
  end
end

def to_num(buf)
  if buf.empty?
    nil
  else
    if buf.match?('\.')
      buf.to_f
    else
      buf.to_i
    end
  end
end

def load_table(tables, line)
  a = line.split(',').map(&:strip)
  h = {}
  # h[:name] = a[0]
  h[:a]  = to_num(a[1])
  h[:z]  = to_num(a[2])
  h[:ct] = to_num(a[3])
  h[:log] = a[4]
  h[:range] = Range.new(h[:a], h[:z])
  tables[a[0]] ||= []
  tables[a[0]] << h
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

def set_var(vars, v)
  unless v.start_with?('table')
    vars[v] = [] unless vars.include?(v)
  end
end

def set_log(fc)
  fc[:logs] = {}
  fc[:para].each do |para|
    para.each do |par|
      if par[:type] == :log
        fc[:logs][par[:log_title]] = Log.new(par[:log_title])
      end
    end
  end
end

__END__
fc, tables = load_parameter
vars = pickup_var(fc)
p vars.size
pp vars
p '-' * 36
pp tables

File.open('result.txt', 'w') do |f|
  f.puts fc.pretty_inspect
end
# pp fc




