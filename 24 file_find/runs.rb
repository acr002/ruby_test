
a = []
h = "##{'=' * 77}"
Dir.glob('**/routes.rb').each do |fn|
  # p File.expand_path(fn)
  if fn == 'routes.rb'
    a << "# #{File.expand_path(fn)}"
    File.foreach(fn) do |line|
      a << line
    end
    a << h
  end
end
unless a.empty?
  File.open('result.rb', 'w'){|f| f.puts a}
end

