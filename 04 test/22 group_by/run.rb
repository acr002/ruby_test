
require 'pp'

# Enumerable#group_byの試しです。
# ブロック内で評価した結果をHashのkeyとして持ち、集めた値を配列で持ちます。
a = %w(a b c d e) + [1, 2, 3, 4, 5] + [nil, nil, nil]
p a
# b = a.group_by{_1.class}
# pp b

# 実装
def test_group_by(ar)
  h = {}
  ar.each do |e|
    h[yield(e)] ||= []
    h[yield(e)] << e
  end
  h
end

b = test_group_by(a){_1.class}
p b
