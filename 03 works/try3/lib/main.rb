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

# arct�ƒl�ɂ���var����ɂ��܂��B
def cc_arg(ol, method)
  ar = method[:arct].dup
  method[:var].each do |e|
    if ol.include?(e)
      ar << ol[e]
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
  receiver = ol[block[:receiver].body]]
  # ����(var)�̕ϐ��W�J�����A��������ɂ��܂��B
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

def works(fc, line)
  vars = pickup_var(fc)
  fc[:ol] = set_ol(fc, vars, line)
  fc[:para].each do |blocks|
    blocks.each do |block|
      case block[:type]
      when :if
      when :unless
      when :do
      end
    end
  end
  retouch(fc[:ol], line)
end



