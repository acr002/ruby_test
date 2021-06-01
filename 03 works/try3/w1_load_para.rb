
# parameterファイルを読み込んで、fc hashを返します。

# load(parameter)
def load_parameter
  fc = []
  para_fns = Dir.glob('para*.txt')
  para_fns.each do |fn|
    File.foreach(fn) do |line|
      next if line.empty?

    end
  end
end

