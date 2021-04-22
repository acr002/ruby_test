
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
end

