
# 2021.04.20(��)
# line�����H���Ă����A���ʂ��o�͂���K�v������܂��B
# ����line�����H���Ă���gc.map!�ł������ł����A�V�����z��ɑ}�����Ă��������ł������Ǝv���܂��B
# result = gc.map{} �ł������Ǝv���܂��B
a = %w(q b c d e f g a)
b = a.map do |e|
  unless e == 'e'
    'test'
  else
    e
  end
end
p a, b
################################


