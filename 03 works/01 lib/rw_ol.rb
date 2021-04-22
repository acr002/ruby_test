
# apf�͌X��apf��n���Ă��������B
# buf��line[apf.x, apf.range]��n���Ă��������B
class OL
  def initialize(buf, apf)
    @base = ''
    @value = to_a(buf, apf)
    @touch = 0
  end

  def to_a(buf, apf)
    a = []
    apf.limit.times do |i|
      a << buf[i * apf.size, apf.size].to_i
    end
    a
  end
end

class GC
  def initialize(apf, key)
    @apf = apf[key]
    @ol = OL.new
  end
end

