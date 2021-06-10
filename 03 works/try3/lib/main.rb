#-----------------------------------------------------------[date: 2021.06.10]

require 'H:/A/ruby/_github/03 works/try3/lib/load_apf.rb'
require 'H:/A/ruby/_github/03 works/try3/lib/load_para.rb'
require 'H:/A/ruby/_github/03 works/try3/lib/load_ol.rb'
require 'H:/A/ruby/_github/03 works/try3/lib/cc_method.rb'
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
    unless olv.value == olv.base
      a = olv.apf
      buf = olv.value.map{_1.to_s.rjust(a.size, '0')}.join
      fc[:line][a.x - 1, a.range] = buf[0, a.range].ljust(a.range)
    end
  end
end

def cc_works(fc)
  fc[:para].each do |blocks|
    blocks.each do |block|
      # receiverとmethodsの評価をします。
      result = cc_method(fc[:ol], block)
      # p result
      p '-' * 24
      # その結果を使ってtype毎に評価します。この評価によって次に進むか、このlinerを終了させるかを決めます。
      case block[:type]
      when :if
        break unless result.first
      when :unless
        break if result.first
      # when :do    # doは必要ありません。すでにolは変更されています。
      end
    end
  end
end

def works(fc)
  set_ol(fc)
  p fc[:line]
  cc_works(fc)
  File.open('result.txt', 'w'){|f| f.puts fc.pretty_inspect}
  retouch(fc)
  fc[:line]
end



