
a = 'abccdefg'
p a
p a.gsub(/def/, '!!')
################################

a = 'xbbb-xbbb-abbb'
b = /(b+)/
# c = "#{$1}"
p a, b
# p a.gsub(b){|e| "a#{e}c" }
p a.gsub(b){ "ac" }
################################

hr = '-' * 24
a = 'xbbb-xbbb-abbb'
b = /x/
p a, b
p hr
# p a.gsub(b){|e| "a#{e}c" }
# p a.gsub(b){"<p>#{_1}</p>"}
# p a.gsub(b){|e| "<p>#{e}</p>"}

c = a.gsub(b) do |e|
  'y'
end
p c

# b = /(\w+)/
#=> "<p>xbbb</p>-<p>xbbb</p>-<p>abbb</p>"
# b = /(\w+)?/
#=> "<p>xbbb</p><p></p>-<p>xbbb</p><p></p>-<p>abbb</p><p></p>"
################################

# hash�̃��X�g��n���ꍇ�B
# union��pattern��I��|�ŘA������Regexp�Ƃ��ĕԂ��Ă���܂��B
a = "hoge��ruby�ł�"
h = {}
h["hoge"] = '��'
h["ruby"] = '��������'
h["�ł�"] = '�Ȃ�܂�!!'
# b = a.gsub(/hoge|ruby/, h)
b = a.gsub(Regexp.union(h.keys), h)
p a.encode('utf-8'), b.encode('utf-8'), h
################################

# string(escape�̈���)�̒��Ő��K�\���̓��ʂȈӖ����������̒��O�ɃG�X�P�[�v������}�������������Ԃ��Ă����B
# a = '\n'
a = '<p>test</p>'
b = Regexp.escape(a)
puts a, b
################################

# Regexp.union�̃e�X�g
a = %w(a b c d e)
b = Regexp.union(a)
p a, b
################################













