
require 'csv'

# リストやテーブルなどまとまったデータはどのように持ち、どのようにプログラムに組み込むべきかは
# 人それぞれ、チームごとのやり方かと思いますが、個人的にはそれ単体のファイルとして独立させた方が扱いやすい思っています。
# たとえばエクセルのvlookupのようにkeyを元に特定の値を取得する場合、テーブルとして一つのcsvを作っておく方法です。

# 動きとしてはcsvのデータをHashに入れます。このHashにはキーとなる文字列をkeyにし、引き出す値をvalueにしておきます。
# 確認する際はHashのinclude?(key)で確認した上でvalueを呼び出します。

# csvのデータの内、２つの列をHashに格納します。
# エクセルのvlookup()のテーブルのようなイメージです。
# 例えば「A列をキーにして、B列の値を使う」感じです。

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




