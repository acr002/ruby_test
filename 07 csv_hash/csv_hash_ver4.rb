
require 'csv'

# csv�̃f�[�^�̓��A�Q�̗��Hash�Ɋi�[���܂��B
# �G�N�Z����vlookup()�̃e�[�u���̂悤�ȃC���[�W�ł��B
# �Ⴆ�΁uA����L�[�ɂ��āAB��̒l���g���v�����ł��B
# 
# �{���Ȃ�΁Acsv�̃f�[�^��������x���������ǂ������m�F���ׂ��ł��B
# key�ƂȂ��ɏd���͂Ȃ����Ƃ��Akey�͐��l�Ȃ̂������񂩂Ȃ̂��Ȃǂł��B

def csv_hash(path, x_key = 2, x_value = 3)
  a = CSV.read(path, encoding: 'cp932:utf-8', headers: true)
  xk = a.headers[x_key - 1]
  xv = a.headers[x_value - 1]
  a[xk].zip(a[xv]).to_h
end
################################

h = csv_hash('sample.csv', 7, 8)
# h = csv_hash('sample.csv')
p h




