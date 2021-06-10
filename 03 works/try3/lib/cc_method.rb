# coding: cp932
#-----------------------------------------------------------[date: 2021.06.10]

require 'H:/A/ruby/_github/03 works/try3/lib/work_method.rb'

# receiver[:body]�̒l�������ŏ㏑�����Ă��܂��B�㏑���ł͂Ȃ��ǉ��Ȃǂ��������ꍇ��method���g���Ă��������B
def cc_receiver(ol, receiver)
  a = cc_arg(ol, receiver)
  unless a.empty?
    ol[receiver[:body]].value = a
  end
  ol[receiver[:body]]
end

# arct�ƒl�ɂ���var����ɂ��܂��B
def cc_arg(ol, method)
  ar = method[:arct].dup
  method[:var].each do |e|
    # ���_�I�ɂ�ol�ɂȂ�var�͂Ȃ��͂��ł��B
    if ol.include?(e)
      ar.concat(ol[e].value)
    else
      puts "cc_arg: ol��[#{e}]������܂���B".encode('utf-8')
    end
  end
  ar.uniq
end

def cc_method(ol, block)
  # receiver��arct��var���w�肳��Ă����ꍇ�A�u��������H�ǉ�����H
  # ����Ƃ���Ȃ�Βu���������킩��₷���H
  # arg�������w�肳��Ă�����ǂ�����H
  # ���L�͈����Œu�������Ă��܂��B�܂����ʂɕϐ�(ol_receiver)�ɑ�����Ă����܂��B
  ar = cc_receiver(ol, block[:receiver]).value.dup
  # p "cc_method, ar:#{ar}, block:#{block}"
  block[:methods].each do |method|
    # ����(var)�̕ϐ��W�J�����A��������ɂ��܂��B
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
      # ����arg��Integer����ɂ��ׂ��H
      # arg.first�������Ă��܂���B
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

