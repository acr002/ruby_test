# coding: cp932

require 'csv'
require 'win32ole'

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

# 参考
=begin
app = WIN32OLE.new('Excel.Application')
book = app.workbooks.add
path_out = File.expand_path('test.xls').gsub('/', '\\')
book.saveas filename: path_out
book.close savechanges: false
qpp.quit
=end
hr = '-' * 36

ar = []
list = CSV.read('list.csv', headers: true, encoding: 'cp932')
fns = Dir.glob('*.xls*').map{|e| File.expand_path(e).gsub('/', '\\')}
app = WIN32OLE.new('Excel.Application')
fns.each do |fn|
  p fn
  book = app.workbooks.open(fn)
  a = book.worksheets('data').usedrange.value
  tar = a[1]
  list.each do |ec|
    x_total = ec['x_total'].to_i - 1
    x_part  = ec['x_part'].to_i - 1
    sign = ec['sign']
    total = tar[x_total].to_i
    part = tar[x_part].to_i
    unless istrue?(total, sign, part)
      ar << "・設問: #{ec['sec_t']}と#{ec['sec_p']}(「#{ec['block1']} #{ec['block2']}」#{ec['sec_text_t']}と#{ec['sec_text_p']})"
      ar << "・回答: #{ec['sec_t']} = [#{total}]"
      ar << "　　　  #{ec['sec_p']} = [#{part}]"
      ar << "・確認: 「#{ec['sec_p']}」は「#{ec['sec_t']}」#{h_sign[sign]}にご回答ください。"
      ar << hr
    end
  end
  book.close savechanges: false
  p hr
end
app.quit

File.open('result.txt', 'a') do |f|
  f.puts ar
end

