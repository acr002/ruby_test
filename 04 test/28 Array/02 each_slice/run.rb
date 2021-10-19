
# •¶š—ñ‚ğ•ªŠ„
# split‚Æchars‚Ì”äŠr‚ÆAcharsŒã‚Ìeach_slice
hr = '-' * 24
a = 'Q01_A_1_gender'
b = a.split('_')
c = a.chars
p a, b, c
p hr

d = c.each_slice(2).map(&:join)
p d
p hr

e = b[-1].chars
p e.each_slice(4).map(&:join)
p hr
################################

