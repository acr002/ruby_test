
require 'pp'

# Enumerable#group_by�̎����ł��B
# �u���b�N���ŕ]���������ʂ�Hash��key�Ƃ��Ď����A�W�߂��l��z��Ŏ����܂��B
a = %w(a b c d e) + [1, 2, 3, 4, 5] + [nil, nil, nil]
p a
# b = a.group_by{_1.class}
# pp b

# ����
def test_group_by(ar)
  h = {}
  ar.each do |e|
    h[yield(e)] ||= []
    h[yield(e)] << e
  end
  h
end

b = test_group_by(a){_1.class}
p b
