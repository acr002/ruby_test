
require 'csv'
require 'json'

# csvからHashに変換します。
# hashからjsonにします。
# windowsで使われる事を想定しているので、encodingをcp932に指定しています。

# 引数 path:    ファイル名
# 引数 x_key:   keyが入っている列番号(1から始めます)
# 引数 x_value: valueが入っている列番号(1から始めます)
# hashのkeyはシンボル化しています。
def csv_hash(path, x_key = 1, x_value = 2)
  h = Hash.new
  xk = x_key - 1
  xv = x_value - 1
  a = CSV.read(path, encoding: 'cp932:utf-8')
  a.each do |row|
    h[row[xk].to_sym] = row[xv]
  end
  # valueをすべて配列に持つ場合は下記を使用してください。
  # 重複分も保持します。array.first, array.lastにて優先を決めても良いかもしれません。
  # a.each do |row|
  #   h[row[xk].to_sym] ||= Array.new
  #   h[row[xk].to_sym] << row[xv]
  # end
  h
end

def put_json_pg(path, h)
  File.open(path, 'w', encoding: 'cp932') do |f|
    f.puts JSON.pretty_generate(h)
  end
end

h = csv_hash('sample.csv')
p h
put_json_pg('result.json', h)
# puts JSON.pretty_generate(h)
################################

# /\w/  英数と_を表します。
# /\W/  は英数と_以外を表します。
b = 'testあdata_01 '.encode('utf-8')
a = b.strip.upcase
p a.strip.match?(/\W/)
p a.to_sym
################################

# flattenは深さが１の配列に実行しても問題なく動きました。
a = [1, 2, 3]
p a.flatten.flatten.flatten
################################

# %w()ではスペースの連続は無視、変数展開はしないようです。
b = 'test data'
a = %w(a b c d e  1 2 3 4 5 #{b})
p a
################################

# nilをto_sすると''になります。
# a = nil
a = ' '
p a.to_s.strip.empty?
################################









