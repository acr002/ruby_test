
# ���L�͎��s
# a = (1..5).to_a
# b = a.transpose
# p a, b

# a = [[1, 3], [2, 5], [4, 6]]
# b = a.transpose
# p a, b

# a = (1..9).to_a
# b = %w(a b c d e f g h i)
# p [a, b].transpose
# a��b�̗v�f���������łȂ���΃G���[�ɂȂ�܂��B

a = (1..9).to_a
b = %w(a b c d e f g h i j)
c = a.zip(b)
p a, b, c
p c.to_h


