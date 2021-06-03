
# parameterファイルを読み込んで、fc hashを返します。

# load(parameter)
def load_parameter
  fc = []
  para_fns = Dir.glob('para*.txt')
  para_fns.each do |fn|
    File.foreach(fn) do |line|
      next if line.empty?
      blocks = line.split(',')
    end
  end
end

def sep_blocks(blocks)
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
    if a.include?('must')
      on_must = true
      a.delete('must')
    end
    h = {}
    h[:type] = type
    h[:method_base] = a.join(' ')
    h
  end
end


