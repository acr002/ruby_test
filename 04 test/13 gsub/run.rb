# coding: cp932

# どうやらRegexp.unionなら配列の文字列を選択|で連結してRegexpとして返してくれるようなので
# Hashのkeyをvalueに変換するなら下記のように書けるようです。
# もっとキレイなやり方があるような気もしますが。。

Regexp.unionで配列の文字列を選択|で連結してRegexpとして返してくれるようなので
Hashを使って、keyをvalueに置き換えるのなら下記のように書けるようです。
もっとキレイなやり方があるような気もしますが。。


h = {}
h["hoge"] = '私'
h["ruby"] = '金持ちに'
h["です"] = 'なります!!'
p "hogeはrubyです".gsub(Regexp.union(h.keys), h).encode('utf-8')


