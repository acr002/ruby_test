#-----------------------------------------------------------[date: 2021.06.14]

require './lib/load_apf.rb'
require './lib/load_para.rb'
require './lib/load_ol.rb'
require './lib/cc_method.rb'
require 'pp'

def max_size(fc)
  max_size = 0
  fc[:apf].each do |ak, av|
    b = (av.x + av.range - 1)
    max_size = b if max_size < b
  end
  (((max_size - 1) / 100) + 1) * 100
end

def load_files
  fc = {}
  fc[:apf] = load_apf
  fc[:para], fc[:tables] = load_parameter
  fc
end

def retouch(fc)
  fc[:ol].each do |olk, olv|
    # re = olv.value.uniq.sort
    re = olv.value.uniq
    unless re == olv.base
      a = olv.apf
      buf = re.map{_1.to_s.rjust(a.size, '0')}.join
      fc[:line][a.x - 1, a.range] = buf[0, a.range].ljust(a.range)
    end
  end
end

def cc_works(fc)
  fc[:para].each do |blocks|
    blocks.each do |block|
      # log��log�ȊO�ŕ����܂��B
      unless block[:type] == :log
        # receiver��methods�̕]�������܂��B
        result = cc_method(fc[:ol], block, fc[:tables])
        # ���̌��ʂ��g����type���ɕ]�����܂��B���̕]���ɂ���Ď��ɐi�ނ��A����liner���I�������邩�����߂܂��B
        case block[:type]
        when :if
          break unless result.first
        when :unless
          break if result.first
        when :do
          # do�͕K�v�Ȃ��H���ł�ol�͕ύX����Ă���H
          fc[:ol][block[:receiver][:body]].value = result
        end
      else
        # write log
      end
    end
  end
end

def works(fc)
  set_ol(fc)
  cc_works(fc)
  File.open('result.txt', 'w'){|f| f.puts fc.pretty_inspect}
  retouch(fc)
  fc[:line]
end



