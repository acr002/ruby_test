#-----------------------------------------------------------[date: 2021.06.08]

class OL
  attr_reader :key, :value, :base, :on_change, :apf
  def initialize(key)
    @key = key
    @value = []
    @base = []
    @on_change = false
    @apf = nil
    self
  end

  # @keyと@on_changeはnewの段階で入れたものを使います。
  def set(line, apf)
    @value = []
    apf.limit.times do |i|
      a = line[apf.x + (i * apf.size), apf.size]
      @value << a.to_i unless a.nil?
    end
    # @base = line[apf.x, apf.range]
    @base = @value
    @apf = apf
    self
  end
end

# olのベースとなるvar(変数)を集めます。
# レシーバもvarに含めて考えます。
# table以外を対象としています。
# fc[:para][][:type]
# fc[:para][][:method_base]
# fc[:para][][:receiver][:body]
# fc[:para][][:receiver][:arct]
# fc[:para][][:receiver][:var]
# fc[:para][][:methods][][:body]
# fc[:para][][:methods][][:arct]
# fc[:para][][:methods][][:var]
def pickup_var(fc)
  vars = {}
  fc[:para].each do |liner|
    liner.each do |block|
      set_var(vars, block[:receiver][:body])
      block[:receiver][:var].each do |v|
        set_var(vars, v)
      end
      block[:methods].each do |method|
        method[:var].each do |v|
          set_var(vars, v)
        end
      end
    end
  end
  vars
end

# var(変数)に分かるものは値を入れます。
def set_ol(fc)
  ol = {}
  vars = pickup_var(fc)
  vars.each do |k, v|
    if fc[:apf].include?(k)
      ol[k] = OL.new(k).set(fc[:line], fc[:apf][k])
    else
      ol[k] = OL.new(k)
    end
  end
  fc[:ol] = ol
end

