
require 'csv'

# ���X�g��e�[�u���Ȃǂ܂Ƃ܂����f�[�^�͂ǂ̂悤�Ɏ����A�ǂ̂悤�Ƀv���O�����ɑg�ݍ��ނׂ�����
# �l���ꂼ��A�`�[�����Ƃ̂������Ǝv���܂����A�l�I�ɂ͂���P�̂̃t�@�C���Ƃ��ēƗ����������������₷���v���Ă��܂��B
# ���Ƃ��΃G�N�Z����vlookup�̂悤��key�����ɓ���̒l���擾����ꍇ�A�e�[�u���Ƃ��Ĉ��csv������Ă������@�ł��B

# �����Ƃ��Ă�csv�̃f�[�^��Hash�ɓ���܂��B����Hash�ɂ̓L�[�ƂȂ镶�����key�ɂ��A�����o���l��value�ɂ��Ă����܂��B
# �m�F����ۂ�Hash��include?(key)�Ŋm�F�������value���Ăяo���܂��B

# csv�̃f�[�^�̓��A�Q�̗��Hash�Ɋi�[���܂��B
# �G�N�Z����vlookup()�̃e�[�u���̂悤�ȃC���[�W�ł��B
# �Ⴆ�΁uA����L�[�ɂ��āAB��̒l���g���v�����ł��B

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




