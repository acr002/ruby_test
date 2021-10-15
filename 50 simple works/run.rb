
class Array
  def to_buf(width = 1, padding = '0')
    self.map{_1.to_s.rjust(width, padding)}.join
  end
end
ar = [1, 3, 5, 999]
p ar.to_buf(2, ' ')
p ar.to_buf(2)
p ar.to_buf
p ar
################################





