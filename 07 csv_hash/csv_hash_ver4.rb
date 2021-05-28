
require 'csv'

# csvのデータの内、２つの列をHashに格納します。
# エクセルのvlookup()のテーブルのようなイメージです。
# 例えば「A列をキーにして、B列の値を使う」感じです。
# 
# 本来ならば、csvのデータがある程度正しいかどうかを確認すべきです。
# keyとなる列に重複はないかとか、keyは数値なのか文字列かなのかなどです。

def csv_hash(path, x_key = 2, x_value = 3)
  a = CSV.read(path, encoding: 'cp932:utf-8', headers: true)
  xk = a.headers[x_key - 1]
  xv = a.headers[x_value - 1]
  a[xk].zip(a[xv]).to_h
end
################################

h = csv_hash('sample.csv', 7, 8)
# h = csv_hash('sample.csv')
p h




