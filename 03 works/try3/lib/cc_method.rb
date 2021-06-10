# coding: cp932
#-----------------------------------------------------------[date: 2021.06.10]

require 'H:/A/ruby/_github/03 works/try3/lib/work_method.rb'

# receiver[:body]の値を引数で上書きしています。上書きではなく追加などをしたい場合はmethodを使ってください。
def cc_receiver(ol, receiver)
  a = cc_arg(ol, receiver)
  unless a.empty?
    ol[receiver[:body]].value = a
  end
  ol[receiver[:body]]
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
  # 下記は引数で置き換えています。また特別に変数(ol_receiver)に代入しておきます。
  ar = cc_receiver(ol, block[:receiver]).value.dup
  # p "cc_method, ar:#{ar}, block:#{block}"
  block[:methods].each do |method|
    # 引数(var)の変数展開をし、引数を一つにします。
    arg = cc_arg(ol, method)
    case method[:body]
    when 'include?', 'include_any?'
      ar = [ar.include_any?(arg)]
    when 'include_all?'
      ar = [ar.include_all?(arg)]
    when 'other?'
      ar = [ar.other?(arg)]
    when 'same?'
      ar = [ar.same?(arg)]
    when 'zero?'
      ar = [ar.zero?]
    when 'nil?'
      ar = [ar.nil?]
    when 'empty?'
      ar = [ar.empty?]
    when 'valid?', 'valid_any?'
      ar = [ar.valid_any?]
    when 'walid_all?'
      ar = [ar.valid_all?]
    when 'count?'
      # このargはInteger限定にすべき？
      # arg.firstしか見ていません。
      ar = [ar.count?(arg)]
    when 'all9?'
      ar = [ar.all9?(ol.apf.range)]
    when 'put', 'add'
      [ar.concat(arg)]
    when 'clear'
      ar.clear
    when 'delete'
      ar.delete_ar(arg)
    when 'change'
      ar = arg
    when 'clear_zero'
      ar.delete(0)
    when 'set_zero'
      ar = [0] if ar.empty?
    when 'table'
      ar = ar.table(arg)
    when 'sum'
      ar = [ar.sum]
    when 'average'
      ar = [ar.sum.to_f / ar.size]
    when 'median'
      ar = median
    when 'axis'
    when 'compound'
    when 'max'
      ar = [ar.compact.max]
    when 'min'
      ar = [ar.compact.min]
    when 'clone'
      ar
    when 'copy'
      ar
    when '+', 'calc+'
      ar = [ar.sum + arg.sum]
    when '-', 'calc-'
      ar = [ar.sum - arg.sum]
    when '/', 'calc/'
      ar = [ar.sum / arg.sum]
    when '*', 'calc*'
      ar = [ar.sum * arg.sum]
    when '**','calc**'
      ar = [ar.sum ** arg.sum]
    when '*10**', 'calc*10**'
      ar = [ar.sum * (10 ** arg.sum)]
    when '/10**', 'calc/10**'
      ar = [ar.sum / (10 ** arg.sum)]
    when '%', 'calc%', 'mod'
      ar = [ar.sum % arg.sum]
    when 'count'
      ar = [ar.size]
    when 'rand'
      ar = ar.sample(arg.sum)
    when 'reverse'
    when 'range'
    end
  end
  ar
end

