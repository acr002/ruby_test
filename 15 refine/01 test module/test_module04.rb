
# 2021.07.19(月)
# 拡張メソッドを作成したファイルをrequireし、
# using以降で呼び出せば、拡張メソッドを使用することができます。

require './test_module04_base.rb'

using Ext

p 10.div_zero(2)
p 10.div_zero(0)
p [1, 2, 3, 4, 5].sum_count



