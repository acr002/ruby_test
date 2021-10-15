
a = <<A
{
test
}
A

p a.split
################################

# 2021.10.15(金)
# string[x, size]
# xが文字列数より大きい場合はnilが返ります。
# sizeが文字列数より大きい場合は文字列が存在する範囲が返ります。
# xもsizeも大きい場合はnilが返ります。
a = 'test'
p a[0, 10]
p a[10]
p a[10, 3]
p a[0, 10]
p a[10, 10]
################################

# String#sliceを左辺に置いた場合
# 指定するxが文字列よりも大きいとエラーになります。
# 指定するsizeが元の文字列を超えてしまう場合、元の大きさを超えて置換られます。エラーにはならないので注意してください。
a = '123456789012345678901234567890'
a[29, 3] = 'xxx'
# a[50, 3] = 'xxx'
p a
p a.size
################################







