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
    p "#{sign}はありません".encode('utf-8')
  end
end

h_sign = {}
h_sign['<']  = 'より大きくなるよう'
h_sign['>']  = 'より小さくなるよう'
h_sign['<='] = 'と同数または大きくなるよう'
h_sign['>='] = 'と同数または小さくなるよう'
h_sign['=']  = 'と同数になるよう'
h_sign['<>'] = 'と同数にならないよう'

total = 8
sign = '<'
part  = 8
p "(total)#{total} #{sign} (part)#{part}"
unless istrue?(total, sign, part)
  p "「B(#{part})」は「A(#{total})」#{h_sign[sign]}にご回答ください。".encode('utf-8')
else
  p 'ok'
end




