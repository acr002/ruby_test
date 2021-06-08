#-----------------------------------------------------------[date: 2021.06.08]

require 'H:/A/ruby/_github/03 works/try3/lib/load_apf.rb'
require 'H:/A/ruby/_github/03 works/try3/lib/load_para.rb'
require 'H:/A/ruby/_github/03 works/try3/lib/load_ol.rb'
require 'H:/A/ruby/_github/03 works/try3/lib/cc_method.rb'

def load_files
  fc = {}
  fc[:apf] = load_apf
  fc[:para], fc[:tables] = load_parameter
  fc
end

def cc_works(fc)
  fc[:para].each do |blocks|
    blocks.each do |block|
      # receiver��methods�̕]�������܂��B
      result = cc_method(fc[:ol], block)
      # ���̌��ʂ��g����type���ɕ]�����܂��B���̕]���ɂ���Ď��ɐi�ނ��A����liner���I�������邩�����߂܂��B
      case block[:type]
      when :if
      when :unless
      # when :do    # do�͕K�v����܂���B���ł�ol�͕ύX����Ă��܂��B
      end
    end
  end
end

def works(fc)
  set_ol(fc)
  cc_works(fc)
  retouch(fc)
end



