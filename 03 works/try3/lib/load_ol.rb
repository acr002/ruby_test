#-----------------------------------------------------------[date: 2021.06.14]

class OL
  attr_reader :key, :base, :apf
  attr_accessor :value
  def initialize(key)
    @key = key
    @value = []
    @base = []
    @apf = nil
    self
  end

  # @keyはnewの段階で入れたものを使います。
  def set(line, apf)
    @value = []
    apf.limit.times do |i|
      a = line[(apf.x - 1) + (i * apf.size), apf.size]
      unless a.nil?
        unless a.strip.empty?
          @value << a.to_i
        end
      end
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

# var(変数)のうち、分かるものは値を入れます。
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

