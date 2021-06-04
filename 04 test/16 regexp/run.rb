
# カッコで囲まれたドットは無視し、カッコで囲まれていないドットで区切る。
hr = '-' * 36



# a = 'You say, "Yes, I am.", "No, I am not.".'
a = 'You say.(Yes. I am.) . (No. I am not.).'
pat1 = /"([^"]*)"[^"]*"([^"]*)"/
# pat1 = /"(A)"A"(A)"/
pat2 = /"(.*?)"[^"]*"(.*?)"/
pat1_1 = /"([^"]*)"/
pat2_1 = /"(.*?)"/
# pat = /,(?=(?![^"]*"[^"]*")*[^"]*$)/
#     /,(?=(?:[^"]*"[^"]*")*[^"]*$)/
# pat = /,(?!([^"]"[^"]")*(?![^"]"))/       # 成功
# pat = /\.(?!([^"]*"[^"]")*(?![^"]"))/
pat = /(?=([^\(]\(\.[^\)]\))*(?![^\(]\())\./
pat = /(?<!\()*\./

# p a.scan(pat1_1)
# p a.scan(pat2_1)
# puts a.split(pat1_1)
# puts hr
# puts a.split(pat2_1)
# puts hr
puts a.split(pat)
################################


__END__

'A.c<2.2>.d<10 12>.zero?'
'body.body<2.4>.body<arg>.body<.7>.body'
'You say, "Yes, I am.", "No, I am not.".'
'You say.<Yes. I am.> . <No. I am not.>.'

/.(?<![^>]*>)/

A.c(2.2).d(10 12).zero?
body.body(2.4).body(arg).body(.7).body
You say, "Yes, I am.", "No, I am not.".
You say.(Yes. I am.) . (No. I am not.).
