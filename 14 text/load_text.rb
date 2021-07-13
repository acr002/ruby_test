# coding: cp932

require 'csv'

# csv��ǂݍ����tt�Ɋi�[���܂��B
tt = CSV.read('data.csv', encoding: 'cp932:utf-8', headers: true)

# csv�̒��g��text�ɏo�͂��܂��B
# File.open('result.txt', 'w') do |f|
#   tt.each do |row|
#     f.puts "#{row['FA']}(#{row['age']} #{row['gender']})"
#   end
# end

col = []
a = '�ǎ�'.encode('utf-8')
key_age = '��'.encode('utf-8')
tt.each do |row|
  # p row['FA']
  if row['FA'].include?(a)
    col << row
  end
end

File.open("result(#{a}).txt", 'w') do |f|
  col.each do |e|
    f.puts "#{e['id']} #{e['FA']} (#{e['age']}#{key_age} #{e['gender']} #{e['pref']})"
  end
end



