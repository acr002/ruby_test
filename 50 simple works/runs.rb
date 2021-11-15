
class Array
  def to_buf(width = 1, padding = '0')
    self.map{_1.to_s.rjust(width, padding)}.join
  end
end
ar = [1, 3, 5, 999]
p ar.to_buf(2, ' ')
p ar.to_buf(2)
p ar.to_buf
p ar
################################

# �쐬����Array�𕡐����Ɋi�[����ꍇ�A
# ���ׂē���I�u�W�F�N�g���Q�Ƃ��Ă��܂��̂ŁA
# dup�Ȃǂ��g�p���ĕʂ̃I�u�W�F�N�g�ɂ���K�v������܂��B
h = {}
a = (1..9).to_a
h[:ar] = a.dup
# h[:ar] = a
h[:base] = a
h[:ar].map!{_1 + 10}
pp h
################################

# dup�̏ꍇ�͐󂢃R�s�[�ɂȂ�܂��B
# �����ꎟ���[������Ȃ� b = a.map(&:dup) ���g���܂��B
a = [[1, 2], [3, 4]]
b = a
s = a.dup
d = a.map(&:dup)
pp a, b, s, d
a[0][0] = 'test'
pp a, b, s, d
################################

# dup�̏ꍇ�͐󂢃R�s�[�ɂȂ�܂��B
# �����ꎟ���[������Ȃ� b = a.map(&:dup) ���g���܂��B
a = [[1, 2], [3, 4]]
b = a
s = a.dup
d = a.map(&:dup)
pp a, b, s, d
a[0][0] = 'test'
pp a, b, s, d
################################

# String�ł�empty?�̊m�F
# ��������zero�̏ꍇ�Aempty?��true�ɂȂ�܂��B
# �X�y�[�X�����ł�false�ɂȂ�܂��B
a = ' '
p a.empty?
################################

# String#to_i�̊m�F
# ��������zero��to_i�����zero
# �X�y�[�X��to_i���Ă�zero
# ' 12 '��to_i�����12
# ' 1 2 '��to_i�����1�ł��B
# �Ԃ̃X�y�[�X�������̂ł����gsub�Ȃǂ��g�p���܂��B
a = ' 1 2 '.gsub(' ', '')
p [a, a.to_i]
################################

# ������̉E������擾����
a = '12345'
range = 2
r = a.size - range
r = 0 if r.negative?
p a[r..-1]
# p a[-9..-1]
################################


