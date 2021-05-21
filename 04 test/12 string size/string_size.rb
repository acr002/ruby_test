
class Array
  def max_size
    ms = 0
    self.each do |e|
      a = e.size
      ms = a if ms < a
    end
    ms
  end
end

a = File.read('test.txt').split(/\R/)
p a
p a.max_size


