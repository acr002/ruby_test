#-----------------------------------------------------------[date: 2021.06.08]

require 'H:/A/ruby/_github/03 works/try3/lib/load_apf.rb'
require 'H:/A/ruby/_github/03 works/try3/lib/load_para.rb'
require 'H:/A/ruby/_github/03 works/try3/lib/load_ol.rb'

def load_files
  fc = {}
  fc[:apf] = load_apf
  fc[:para], fc[:tables] = load_parameter
  fc
end

def cc_receiver(ol, receiver)
  ol[receiver[:body]] = cc_arg(ol, receiver)
end

# arctと値にしたvarを一つにします。
def cc_arg(ol, method)
  ar = method[:arct].dup
  method[:var].each do |e|
    # 理論的にはolにないvarはないはずです。
    if ol.include?(e)
      ar.concat(ol[e].value)
    else
      puts "cc_arg: olに[#{e}]がありません。".encode('utf-8')
    end
  end
  ar.uniq
end

def cc_method(ol, block)
  # receiverのarctやvarが指定されていた場合、置き換える？追加する？
  # 代入とするならば置き換えがわかりやすい？
  # argが複数指定されていたらどうする？
  receiver = ol[block[:receiver].body]]
  # 引数(var)の変数展開をし、引数を一つにします。
  arg = cc_arg(ol, method)
  block[:methods].each do |method|
    case ol[method[:body]]
    when 'include?'
      receiver.include?(*arg)
    when 'include_all?'
    when 'other?'
    when 'same?'
    when 'zero?'
    when 'nil?'
    when 'empty?'
    when 'valid?'
    when 'count?'
    when 'all9?'
    when 'put'
    when 'add'
    when 'clear'
    when 'delete'
    when 'change'
    when 'clear_zero'
    when 'set_zero'
    when 'table'
    when 'sum'
    when 'average'
    when 'median'
    when 'axis'
    when 'compound'
    when 'max'
    when 'min'
    when 'clone'
    when 'copy'
    when '+',     'calc+'
    when '-',     'calc-'
    when '/',     'calc/'
    when '*',     'calc*'
    when '**',    'calc**'
    when '*10**', 'calc*10**'
    when '/10**', 'calc/10**'
    when '%',     'calc%'
    when 'count'
    when 'rand'
    when 'reverse'
    when 'range'
    end
  end
end

def cc_works(fc)
  fc[:para].each do |blocks|
    blocks.each do |block|
      # receiverとmethodsの評価をします。
      result = cc_method(fc[:ol], block)
      # その結果を使ってtype毎に評価します。この評価によって次に進むか、このlinerを終了させるかを決めます。
      case block[:type]
      when :if
      when :unless
      # when :do    # doは必要ありません。すでにolは変更されています。
      end
    end
  end
end

def works(fc)
  set_ol(fc)
  cc_works(fc)
  retouch(fc)
end



