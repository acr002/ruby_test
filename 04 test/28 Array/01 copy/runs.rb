
# オブジェクトのcopy
# ちょっと不思議ですが、配列内のオブジェクトを破壊的メソッドで変更するとコピー元も変更されます。
# これはmapを使っても、破壊的メソッドの効果は元のオブジェクトまで変更されます。
# 破壊的メソッドではなく、他のオブジェクトを返すものであれば新しいオブジェクトになります。
a = %w(a b c d e f g e f g)
# p a
b = a.dup
# b.map!{_1 << 'x'}
c = b.map{_1.upcase << 'x'}
# b[-1] << 'x'
p a, b, c
################################

# 破壊的メソッドでなければ大丈夫です。
a = (1..9).to_a
b = a.dup
c = b.map{_1.to_s << 'x'}
p a, b, c
################################






