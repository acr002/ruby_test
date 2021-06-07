#-----------------------------------------------------------[date: 2021.06.07]

class OL
  attr_reader :key, :value, :base, :on_change, :apf
  def initialize(key)
    @key = key
    @value = []
    @base = ''
    @on_change = false
    @apf = nil
  end

  def set(line, apf)
    @key = apf.key
    @value = []
    apf.limit.times do |i|
      a = line[apf.x + (i * apf.size), apf.size]
      @value << a.to_i unless a.nil?
    end
    @base = line[apf.x, apf.range]
    @on_change = false
    @apf = apf
    self
  end
end

def set_ol(fc, vars, line)
  ol = {}
  vars.each do |k, v|
    if fc[:apf].include?(k)
      ol[k] = OL.new(k).set(line, fc[:apf][k])
    else
      ol[k] = OL.new(k)
    end
  end
  ol
end

