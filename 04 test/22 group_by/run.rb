
require 'pp'

# Array#group_byの試しです。
# ブロック内で評価結果をHashのkeyとして、値を配列で持ちます。
a = %w(a b c d e) + [1, 2, 3, 4, 5] + [nil, nil, nil]
p a
b = a.group_by{_1.class}
pp b

