
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




