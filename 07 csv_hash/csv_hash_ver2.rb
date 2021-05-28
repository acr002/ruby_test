

# csvからHashに変換します。
# windowsで使われる事を想定しているので、encodingをcp932に指定しています。
#   引数 path:    ファイル名
#   引数 x_key:   keyが入っている列番号(1から始めます)
#   引数 x_value: valueが入っている列番号(1から始めます)
#   hashのkeyはシンボル化しています。
require 'csv'
def csv_hash(path, x_key = 2, x_value = 3)
  h = Hash.new
  xk = x_key - 1
  xv = x_value - 1
  a = CSV.read(path, encoding: 'cp932:utf-8', headers: true)
  a.each do |row|
    unless row[xk].to_s.strip.empty?
      h[row[xk].to_sym] = row[xv]
    end
  end
  h
end

h = csv_hash('sample.csv', 7, 8)
p h
################################

