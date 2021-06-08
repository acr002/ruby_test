#-----------------------------------------------------------[date: 2021.06.08]

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
  block[:methods].each do |method|
    # ����(var)�̕ϐ��W�J�����A��������ɂ��܂��B
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
      # ����arg��Integer����ɂ��ׂ��H
      # arg.first�������Ă��܂���B
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
