
# tally
# 要素を集計します。
# 今まではgroup_byとtransform_valuesを組み合わせて値を求めていました。
# a = %w(c a b b b b b c)
a = %w(1 2 3 4 5 6 1 1 1 1 1 1 2 3 4 3 2 3 3 2 1 1 2 3 4 5 3).map(&:to_i)
b = a.tally
p a
pp b
# c = a.group_by(&:itself).transform_values(&:size)
d = a.group_by(&:itself)
pp d
e = d.transform_values(&:size)
pp e
################################

# tallyでsortする場合です。
# keyの場合はsortで大丈夫です。
# valueの場合はsort_byを使用します。
# それぞれ配列を返すので、.to_hにてHashに戻します。
a = %w(c a b b b b b c)
b = a.tally
p a, b
c = b.sort.to_h
p c
d = b.sort_by{_2}.to_h
p d
e = b.sort_by{_2}.reverse.to_h
p e
################################

# 別の方法
# https://zenn.dev/universato/articles/20201210-z-ruby
a = %w(c a b b b b c)
h = Hash.new(0)
a.each{h[_1] += 1}
p h
################################





