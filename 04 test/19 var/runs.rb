

# 文字列内の変数展開は#{}を使いますが、変数の先頭が$や@の場合は{}を省略できるということです。
class Test
  @@cn = 0
  def initialize(name = '')
    @name = name
    @@cn += 1
  end

  def count
    p "count is #@@cn"
  end
end
a = Test.new('a')
a.count
b = Test.new('b')
b.count
################################

test = <<'EOS'
ここは#{foo} と書こうがそのまま
EOS

# 中身をコマンドとして実行して、結果を代入
test2 = <<`EOC`
some_command #{var1} #{var2}
EOC

test3 = <<"EOS"
これは単なるヒアドキュメントと変わらない
EOS
################################

# -なら終点の識別子にインデントを付けられます。
# ~(チルダ)なら終点の識別子にインデントを付けられ、各行のインデントも無視されます。
a = <<~EOS
test data
in string
EOS

p a.split
# a.split(/\R/) do |e|
#   p e
# end
################################

a = (1..5).map{|i| i ** 2}
# 戻り値
[1, 4, 9, 16, 25]
p a
p ('a'..'z').to_a
p (0..9).to_a
################################













