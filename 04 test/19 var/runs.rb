

# ��������̕ϐ��W�J��#{}���g���܂����A�ϐ��̐擪��$��@�̏ꍇ��{}���ȗ��ł���Ƃ������Ƃł��B
class Test
  @@cn = 0
  def initialize(name = '')
    @name = name
    @@cn += 1
  end

  def count
    p "count is #@@cn"
  end
end
a = Test.new('a')
a.count
b = Test.new('b')
b.count
################################

test = <<'EOS'
������#{foo} �Ə����������̂܂�
EOS

# ���g���R�}���h�Ƃ��Ď��s���āA���ʂ���
test2 = <<`EOC`
some_command #{var1} #{var2}
EOC

test3 = <<"EOS"
����͒P�Ȃ�q�A�h�L�������g�ƕς��Ȃ�
EOS
################################

# -�Ȃ�I�_�̎��ʎq�ɃC���f���g��t�����܂��B
# ~(�`���_)�Ȃ�I�_�̎��ʎq�ɃC���f���g��t�����A�e�s�̃C���f���g����������܂��B
a = <<~EOS
test data
in string
EOS

p a.split
# a.split(/\R/) do |e|
#   p e
# end
################################

a = (1..5).map{|i| i ** 2}
# �߂�l
[1, 4, 9, 16, 25]
p a
p ('a'..'z').to_a
p (0..9).to_a
################################













