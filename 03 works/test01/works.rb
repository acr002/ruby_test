
def load_parameters(path)
  tables = {}
  hp = {}
  Dir.glob("#{path}/par*.txt") do |fn|
    File.foreach(fn) do |line|
      a = line.strip
      next if a.empty?
      next if a.start_with?('#', '*')
      if a.downcase.start_with?('table')
        load_talbe(tables, a)
      else
        para << load_blocks(line.split(';'))
      end
    end
  end
end

def load_blocks(blocks)
  blocks.map do |block|
    next if block.sprit.start_with?('#')
    a = block.split
    case a.first.downcase
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
    unless h[:type] == :log
      a = load_method(a.join)
    end
  end
end

def load_talbe(tables, line)
  a = line.split(',').map(&:strip)
  h = {}
  h[:a] = to_num(a[1])
  h[:z] = to_num(a[2])
  h[:ct] = to_num(a[3])
  h[:log] = a[4]
  h[:range] = Range.new(h[:a], h[:z])
  tables[a[0]] ||= []
  tables[a[0]] << h
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

sf = {}




