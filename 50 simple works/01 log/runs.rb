
require 'csv'

# csv�ɏo�͂��܂��B
# require�͕K�v�ł��B
ar = []
ar << [11, 'e', 28]
ar << [12, 'e2', 32]
za = [1, 2, 3]
zb = [4, 5, 6, za]
zc = [7, 8, 9, zb]
zz = [za, zb, zc]
ar << zz
CSV.open('result.csv', 'w') do |c|
  c << %w(id name age)
  c << [1, 'maruvi', 1]
  c << [2, 'jj', 34]
  c << [3, 'f, g', 34]
  a = 'a, b, c, d'
  c << [4, a, 34]
  ar.each do
    c << _1
  end
end
# open���ău���b�N�Ńu���b�N�����ɔz���n���Ă�����΂��܂�����Ă����悤�ł��B
# �J���}���܂񂾕�����������Ƃ���Ă����悤�ł��B
# �z��̒��̕ϐ��W�J������Ă���܂��B
# �z��̒��̔z��͓W�J���Ă���܂���Beach�Ȃǂŉ񂵂Ȃ���u���b�N�����ɓn���Ă��������B
# �e�v�f���̕ϐ��͓W�J���܂����A��̗v�f�Ƃ��ďo�͂���܂��B
################################

header =  (1..5).to_a.map{"parts_#{_1}"}
p %w(id name) + header
################################

# Array�̌����̏ꍇ�A+ ���concat���g�����������������ł��B
# �v�f��1�ǉ�     <<
# �v�f�𕡐��ǉ�    push
# �z�񓯎m�̌���    concat
header = (1..5).to_a.map{"parts_#{_1}"}
p %w(id name).concat(header)
################################

# Array�̑K���ɗv�f��ǉ�����B
a = %w(a b c d)
p a.unshift(1)
################################





