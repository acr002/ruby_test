
hr = '-' * 36
a = 'if must S02.include?(1, 3, 8), unless must S01.include?(1), do S01.add(1)'
pat_a = /[^\(\)]+/
pat_b = /\([^\(\)]+\)/
pat_c = /[^\(\)]+$/
# pat   = /\([^\)]+(?=\([^\(\)]+\))|[^\(\)]+$/
pat   = /\([^\)]+(?=\([^\(\)]+\))/
pat_test_1 = /\(.*?\)|(,)/
pat_test_2 = /(?!\(\)),/
p = pat_test_2
b = a.scan(p)
p b
p p
puts b
p hr
p a.split(pat_test_1)

# \(.*?\)|(,)
# /(?!\()/
################################

# https://blog.pyq.jp/entry/Python_kaiketsu_200929
# �܂��̓_�u���R�[�e�[�V�����Ŋ���ꂽ���̂����o���B
# 1. �_�u���N�H�[�e�[�V�����ň͂܂ꂽ�u�_�u���N�H�[�e�[�V�����ȊO�̕�����v��T��
# 2. �_�u���N�H�[�e�[�V�����ň͂܂ꂽ�ŏ��̕������T��
a = 'You say, "Yes, I am." and "No I am not.".'
pat1 = /"([^"]*)"[^"]*"([^"]*)"/
# pat1 = /"(A)"A"(A)"/
pat2 = /"(.*?)"[^"]*"(.*?)"/
pat1_1 = /"([^"]*)"/
pat2_1 = /"(.*?)"/
p a.scan(pat2_1)
################################

# https://abicky.net/2010/05/30/135112/
buf = 'hogefuga'
# pat = /.*(?=fuga)/
pat = /(.*)(?=fuga)(.*)/
a = buf.scan(pat)
p a
################################

# �m���ǂ�: �Ώ�(?=)
# �ے��ǂ�: xxxx(?!��ǂݏ���)

# �m���ǂ�: (?<=)xxxx
# �ے��ǂ�: (?<!��ǂݏ���)xxxx
################################

buf = 'A.+(2.2).*(10).zero?'
# pat = /(.*)\(([^\)]+)\)/
# pat = /([^\(]+)\(([^\)]+)\)/
pat = /(?<=\().*?(?=\))/
pat = /(?<=\()[^\)]*/         # �J�b�R�̒��Ɉ͂܂�Ă������
pat = /[^\(]+/
/.*?\(.*?\)/
/(?![^\(]+)\.(?<![^\)]+\))/
a = buf.scan(pat)
p a
################################

# a = 'You say, "Yes, I am.", "No, I am not.".'
a = 'You say.(Yes. I am.) . (No. I am not.).'
pat1 = /"([^"]*)"[^"]*"([^"]*)"/
# pat1 = /"(A)"A"(A)"/
pat2 = /"(.*?)"[^"]*"(.*?)"/
pat1_1 = /"([^"]*)"/
pat2_1 = /"(.*?)"/
# pat = /,(?=(?![^"]*"[^"]*")*[^"]*$)/
#     /,(?=(?:[^"]*"[^"]*")*[^"]*$)/
# pat = /,(?!([^"]"[^"]")*(?![^"]"))/       # ����
# pat = /\.(?!([^"]*"[^"]")*(?![^"]"))/
pat = /(?=([^\(]\(\.[^\)]\))*(?![^\(]\())\./
pat = /(?<!\()*\./

# p a.scan(pat1_1)
# p a.scan(pat2_1)
# puts a.split(pat1_1)
# puts hr
# puts a.split(pat2_1)
# puts hr
puts a.split(pat)
################################

buf = 'https://instagram.com/p/hoge/masujirou'
a = buf.split('/')
p a
p a[-1]
*b, c = a
################################












