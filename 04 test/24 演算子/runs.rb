

# ||�ɂ���
b = 2
c = 3
d = 4
e = 5
p d
a = b == c || d = e
p a
p d
################################

# https://qiita.com/wann/items/3f4dd3f44a6c6ff8e037
a = [1, 2, 3]
b = [2, 3, 4]

# ���ʂ���v�f���o��
p a & b
# => [2, 3]

# �Ō�ɕ]�����ꂽb(true)���o��
p a && b
# => [2, 3, 4]

# a���U�̂���nil�i�E�ӂ����Ȃ��j
a = nil

p a && b
# => nil
################################

a = %w(a b c d e a b e g f g f g)
h = {}
a.each do
  h[_1] ||= 0
  h[_1] += 1
end
p h.sort
################################





