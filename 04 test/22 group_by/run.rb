
require 'pp'

# Array#group_by�̎����ł��B
# �u���b�N���ŕ]�����ʂ�Hash��key�Ƃ��āA�l��z��Ŏ����܂��B
a = %w(a b c d e) + [1, 2, 3, 4, 5] + [nil, nil, nil]
p a
b = a.group_by{_1.class}
pp b

