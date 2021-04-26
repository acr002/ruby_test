
require 'csv'
require 'json'

# csv����Hash�ɕϊ����܂��B
# hash����json�ɂ��܂��B
# windows�Ŏg���鎖��z�肵�Ă���̂ŁAencoding��cp932�Ɏw�肵�Ă��܂��B

def csv_hash(path)
  a = CSV.read(path, encoding: 'cp932:utf-8')
  h = Hash.new
  a.each do |row|
    h[row[0].to_sym] = row[1]
  end
  h
end

def put_json_pg(path, h)
  File.open(path, 'w', encoding: 'cp932') do |f|
    f.puts JSON.pretty_generate(h)
  end
end

# csv����hash�ɁB
h = csv_hash('sample.csv')

# hash����json�ɁB
put_json_pg('result.json', h)

# puts JSON.pretty_generate(h)

