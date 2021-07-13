# coding: cp932

require 'csv'

# csvを読み込んでttに格納します。
tt = CSV.read('data.csv', encoding: 'cp932:utf-8', headers: true)

# csvの中身をtextに出力します。
# File.open('result.txt', 'w') do |f|
#   tt.each do |row|
#     f.puts "#{row['FA']}(#{row['age']} #{row['gender']})"
#   end
# end

col = []
a = '読者'.encode('utf-8')
key_age = '歳'.encode('utf-8')
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



