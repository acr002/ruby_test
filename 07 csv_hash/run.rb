
require 'csv'
require 'json'

# csvからHashに変換します。
# hashからjsonにします。
# windowsで使われる事を想定しているので、encodingをcp932に指定しています。

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

# csvからhashに。
h = csv_hash('sample.csv')

# hashからjsonに。
put_json_pg('result.json', h)

# puts JSON.pretty_generate(h)

