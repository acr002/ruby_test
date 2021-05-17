# coding: cp932

def istrue?(a, sign, b)
  case sign
  when '<'
    a < b
  when '>'
    a > b
  when '<='
    a <= b
  when '>='
    a >= b
  when '='
    a == b
  when '<>'
    a != b
  else
    p "#{sign}�͂���܂���".encode('utf-8')
  end
end

h_sign = {}
h_sign['<']  = '���傫���Ȃ�悤'
h_sign['>']  = '��菬�����Ȃ�悤'
h_sign['<='] = '�Ɠ����܂��͑傫���Ȃ�悤'
h_sign['>='] = '�Ɠ����܂��͏������Ȃ�悤'
h_sign['=']  = '�Ɠ����ɂȂ�悤'
h_sign['<>'] = '�Ɠ����ɂȂ�Ȃ��悤'

total = 8
sign = '<'
part  = 8
p "(total)#{total} #{sign} (part)#{part}"
unless istrue?(total, sign, part)
  p "�uB(#{part})�v�́uA(#{total})�v#{h_sign[sign]}�ɂ��񓚂��������B".encode('utf-8')
else
  p 'ok'
end




