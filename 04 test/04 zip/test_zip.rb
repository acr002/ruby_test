
a = %w(1 2 3 4 5).map(&:to_i)
b = %w(a b c d e f)
c = %w(z y x)

p a.zip(b).join
p a.zip(b, c).join
p a.zip(b)

# ��ƂȂ�v�f���̓��V�[�o��Array�ł��B
# �q�̗v�f�������葽���ꍇ�͉ߕ�����������܂��B
# �q�̗v�f�������菭�Ȃ��ꍇ��nil�ŕ⊮����܂��B

