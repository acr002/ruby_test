

# Array[x..nil] x以降の配列を返す
a = %w(test data ruby on rails in maruvi)
p a
p a[1..nil]
################################

a = %w(test data ruby on rails in maruvi)
p a
p a[-2..nil]
################################

# Array[a..b]
# a, bそれぞれマイナス値なら末尾からカウントし、プラス値なら先頭からカウントします。
# もし、aがbよりも後方になると空の配列を返します。
a = %w(test data ruby on rails in maruvi)
p a
p a[-3..-2]
p a[-4..5]
################################

a = (1..9).to_a
p a[-5..nil]
################################

# Arrayへの指定でカンマが複数続くとエラーになります。
# 最後にひとつだけカンマが付いているのは問題ありません。
# １要素に一つカンマが付く形なら大丈夫ということです。
a = [1, 3, 'test', 4, 'data', ]
p a
################################








