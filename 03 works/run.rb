



class NewString < String
  def initialize(buf)
    self.replace buf
  end
end
a = NewString.new('test data')
p a


################################


