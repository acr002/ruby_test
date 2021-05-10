
a = %w(1 2 3 4 5).map(&:to_i)
b = %w(a b c d e f)
c = %w(z y x)

p a.zip(b).join
p a.zip(b, c).join
p a.zip(b)

# 基準となる要素数はレシーバのArrayです。
# 子の要素数が基準より多い場合は過分が無視されます。
# 子の要素数が基準より少ない場合はnilで補完されます。

