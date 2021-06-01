
module ExtWorks
  refine String do
    def fixer(a, x, xs)
      b = a.to_buf(1).ljust(xs)
      size = b.size < xs ? b.size : xs
      self[x, size] = b[0..size]
      self
    end
  end

  refine Array do
    def to_buf(n)
      self.map{|e| e.to_s.rjust(n, '0')}.join
    end
  end
end

using ExtWorks

a = %w(1 2 3 4 5 6 8 ).map(&:to_i)
b = '----------------------'
p a, b
c = b.fixer(a, 3, 10)
p c




