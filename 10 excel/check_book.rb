# coding: cp932

require 'csv'
require 'win32ole'

def error_value?(a, sign, b)
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
  end
end

# �Q�l
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
    if error_value?(total, sign, part)
      ar << "�E�ݖ�: #{ec['sec_t']}��#{ec['sec_p']}(�u#{ec['block1']} #{ec['block2']}�v#{ec['sec_text_t']}��#{ec['sec_text_p']})"
      ar << "�E��: #{ec['sec_t']} = [#{total}]"
      ar << "�@�@�@  #{ec['sec_p']} = [#{part}]"
      ar << "�E�m�F: �u#{ec['sec_p']}�v�́u#{ec['sec_t']}�v�Ɠ����܂��͂���ȏ�ɂȂ�悤�ɂ��񓚂��������B"
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

