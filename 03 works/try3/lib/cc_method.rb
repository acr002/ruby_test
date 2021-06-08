#-----------------------------------------------------------[date: 2021.06.08]

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
  block[:methods].each do |method|
    # 引数(var)の変数展開をし、引数を一つにします。
    arg = cc_arg(ol, method)
    case ol[method[:body]]
    when 'include?', 'include_any?'
      ar = ar.include_any?(arg)
    when 'include_all?'
      ar = ar.include_all?(arg)
    when 'other?'
      other?(arg)
    when 'same?'
      same?
    when 'zero?'
      zero?
    when 'nil?'
      nil?
    when 'empty?'
      empty?
    when 'valid?', 'valid_any?'
      valid_any?
    when 'walid_all?'
      valid_all?
    when 'count?'
      # このargはInteger限定にすべき？
      # arg.firstしか見ていません。
      count?(arg)
    when 'all9?'
      all9?(ol.apf.range)
    when 'put', 'add'
      ar.concat(arg)
    when 'clear'
      ar.clear
    when 'delete'
      ar.delete_ar(arg)
    when 'change'
      ar = arg
    when 'clear_zero'
      ar.delete(0)
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
