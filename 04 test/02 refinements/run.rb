
module ExtMRV
  refine String do
    def s(a, b)
      self[a, b]
    end
  end

  refine Array do
    def to_el
      self.join
    end
  end
end

using ExtMRV

a = 'test'
b = a.s(1, 2)
p a, b
c = a.split('')
p c
d = c.to_el
p d

