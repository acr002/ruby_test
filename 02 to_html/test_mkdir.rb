
# 2021.04.19(��)
# Dir.mkdir(name)�Ńt�H���_���쐬���܂��B
# ���Ƀt�H���_�����݂���ꍇ�̓G���[�ɂȂ�܂��B
a = %w(a1 a2 b3 c1)
a.each do |e|
  Dir.mkdir(e) unless Dir.exist?(e)
end
################################


