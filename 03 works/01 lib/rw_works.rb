
# 新たにclassを作る必要はある？？
class Gline < String
  def initialize(buf)
    self.replace buf
  end

  def fixer(apf)
    line = self.dup
    apf.each do |k, a|
      unless a.touch.zero?
        if a.apf.type == 'R'
          buf = a.value.to_s.rjust(a.apf.range, ' ')
        else
          buf = a.value.to_s.ljust(a.apf.range, ' ')
        end
        line[a.apf.x, a.apf.range] = buf[0, a.apf.range]
      end
    end
    line
  end

  def retouch(a)
    unless a.touch.zero?
      self[a.apf.x, a.apf.range] = a.value.to_s
    end
  end

  def to_ol(apf)
    base = self[apf.x - 1, apf.range]
    value = []
    apf.limit.times do |i|
      b = self[(i * apf.size), apf.size].strip
      value << b.to_i unless b.empty?
    end
    OL.new(apf, base, value)
  end
end

# まとめる必要はある？？
class OL
  attr_reader :apf, :value, :base, :touch
  def initialize(apf, base, value)
    @apf = apf
    @base = base
    @value = value
    @touch = 0
  end

  def include?(a)
    self.value.include?(a)
  end
end
