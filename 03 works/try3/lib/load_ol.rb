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

  # @key��@on_change��new�̒i�K�œ��ꂽ���̂��g���܂��B
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

# ol�̃x�[�X�ƂȂ�var(�ϐ�)���W�߂܂��B
# ���V�[�o��var�Ɋ܂߂čl���܂��B
# table�ȊO��ΏۂƂ��Ă��܂��B
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

# var(�ϐ�)�ɕ�������̂͒l�����܂��B
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

