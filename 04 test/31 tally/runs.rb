
# tally
# �v�f���W�v���܂��B
# ���܂ł�group_by��transform_values��g�ݍ��킹�Ēl�����߂Ă��܂����B
# a = %w(c a b b b b b c)
a = %w(1 2 3 4 5 6 1 1 1 1 1 1 2 3 4 3 2 3 3 2 1 1 2 3 4 5 3).map(&:to_i)
b = a.tally
p a
pp b
# c = a.group_by(&:itself).transform_values(&:size)
d = a.group_by(&:itself)
pp d
e = d.transform_values(&:size)
pp e
################################

# tally��sort����ꍇ�ł��B
# key�̏ꍇ��sort�ő��v�ł��B
# value�̏ꍇ��sort_by���g�p���܂��B
# ���ꂼ��z���Ԃ��̂ŁA.to_h�ɂ�Hash�ɖ߂��܂��B
a = %w(c a b b b b b c)
b = a.tally
p a, b
c = b.sort.to_h
p c
d = b.sort_by{_2}.to_h
p d
e = b.sort_by{_2}.reverse.to_h
p e
################################

# �ʂ̕��@
# https://zenn.dev/universato/articles/20201210-z-ruby
a = %w(c a b b b b c)
h = Hash.new(0)
a.each{h[_1] += 1}
p h
################################





