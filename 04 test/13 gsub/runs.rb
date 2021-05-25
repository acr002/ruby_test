
a = 'abccdefg'
p a
p a.gsub(/def/, '!!')
################################

a = 'xbbb-xbbb-abbb'
b = /(b+)/
# c = "#{$1}"
p a, b
# p a.gsub(b){|e| "a#{e}c" }
p a.gsub(b){ "ac" }
################################

hr = '-' * 24
a = 'xbbb-xbbb-abbb'
b = /x/
p a, b
p hr
# p a.gsub(b){|e| "a#{e}c" }
# p a.gsub(b){"<p>#{_1}</p>"}
# p a.gsub(b){|e| "<p>#{e}</p>"}

c = a.gsub(b) do |e|
  'y'
end
p c

# b = /(\w+)/
#=> "<p>xbbb</p>-<p>xbbb</p>-<p>abbb</p>"
# b = /(\w+)?/
#=> "<p>xbbb</p><p></p>-<p>xbbb</p><p></p>-<p>abbb</p><p></p>"
################################

# hashのリストを渡す場合。
# unionはpatternを選択|で連結してRegexpとして返してくれます。
a = "hogeはrubyです"
h = {}
h["hoge"] = '私'
h["ruby"] = '金持ちに'
h["です"] = 'なります!!'
# b = a.gsub(/hoge|ruby/, h)
b = a.gsub(Regexp.union(h.keys), h)
p a.encode('utf-8'), b.encode('utf-8'), h
################################

# string(escapeの引数)の中で正規表現の特別な意味を持つ文字の直前にエスケープ文字を挿入した文字列を返してくれる。
# a = '\n'
a = '<p>test</p>'
b = Regexp.escape(a)
puts a, b
################################

# Regexp.unionのテスト
a = %w(a b c d e)
b = Regexp.union(a)
p a, b
################################













