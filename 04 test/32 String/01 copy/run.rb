
# 変数の代入だけでは同一オブジェクトの参照になるのでdupなどを追加います。
a = '00001    120118        '
b = a.dup
b[3, 3] = 'xxx'
p a, b
################################




