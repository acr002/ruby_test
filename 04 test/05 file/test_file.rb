
a = %w(test data at ruby)
a.map! do |e|
  e + "\n"
end
# File.write('test.txt', a)
File.open('test.txt', 'w'){|f| f.puts a}

b = File.read('test.txt').split
p b

