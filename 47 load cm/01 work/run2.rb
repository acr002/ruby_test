# coding: cp932


# buf = 'CMR0400*Ｑ１①Ａ．職員配置／常勤職員／全職員数　　　　　　　　*     R 8'
buf = 'CMR0400*Ｑ１①Ａ．職員配置／常勤職員／全職員数　　　　　　　　*     R 8'.encode('utf-8')
p buf
p buf[8, 27]
p buf[41, 1]
p buf.byteslice(68, 1).encode('utf-8')
p buf.byteslice(68, 1)
p buf.byteslice(62, 3)

################################



