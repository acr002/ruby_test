





class Array
  def mrv_delete(arg)
    arg.each do |e|
      self.delete(e)
    end
  end
end

a = [1, 3, 5, 7]
b = [2, 3, 7]
p a, b
a.mrv_delete(b)
p a, b







