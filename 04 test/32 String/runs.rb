
# ������̕���
# String#chars�ňꕶ���Â̔z��ɂ��܂��B
# String#bytes�ŕ�����𐔒l�̔z��ɂ��܂��B
# bytes�̕��������Ȃ�܂����A�Ɩ����ł͉ǐ���������̂�chars���I�����ɂȂ�Ǝv���܂��B
a = '123abcABC'
cc = a.chars
bb = a.bytes
p cc, bb
################################

# chars�Ȃǂ͌Ăяo�����ɂ̓u���b�N���󂯕t����̂ŁAeach��t�����ɉ񂷂��Ƃ��ł��܂��B
# �����A�����I�ɂ͔񐄏��̂悤�ł��B
a.chars do
  p _1
end
################################

# �ϐ��Ɋi�[����ƁAArray�ɂȂ�̂ŁAeach���K�v�ł��B
p cc.class
cc.each do
  p _1
end
################################

# �����񂩂當�����ЂƂ����o���̂ł����each_char���g���܂��B
a = '123abcABC'
a.each_char do
  p _1
end
################################

p 'a'.ord
p 97.chr
################################

# ����1���󂯎��(1�s��1����������O��)
n = gets.to_s.to_i

# 1�s�𕶎���Ƃ��Ď󂯎��(chomp�ōŌ�̉��s��؂藎�Ƃ��Ă���)
s = gets.to_s.chomp

# ��1�s�̃X�y�[�X��؂�̐�����z��Ƃ��Ď󂯎��
a = gets.to_s.split.map{ |e| e.to_i }

# n�s1��̉��s��؂�̐�����z��Ƃ��Ď󂯎��
a = Array.new(n){ gets.to_s.to_i }

# n�sm��̐�����2�����z��Ŏ󂯎��
m = Array.new(n){ gets.to_s.split.map{ |e| e.to_i } }
################################

# while�ł͂Ȃ��A�uwhile �C���q�v���g������B
# �������B
# �E�ӂ̎���]�������l���^�̊ԁA���ӂ��J��Ԃ����s���܂��B

# while�̉E�ӂɔj��I���\�b�h���L�q�����nil���Ԃ�܂Ŏ��s���܂��B
# ���ӂ̒l���J��Ԃ���܂����A�E�ӂ̕]�����J��Ԃ��̂��ړI�Ȃ̂ŁA���ӂɂ͂����̃I�u�W�F�N�g��u���悤�ł��B
s = '))(())('
1 while s.gsub!('()', '')
p s

# ���L�ł����l�ł��B
s = '))(())('
true while s.gsub!('()', '')
p s
################################




