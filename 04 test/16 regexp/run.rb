
hr = '-' * 36
a = 'if must S02.include?(1, 3, 8), unless must S01.include?(1), do S01.add(1)'
pat_a = /[^\(\)]+/
pat_b = /\([^\(\)]+\)/
pat_c = /[^\(\)]+$/
# pat   = /\([^\)]+(?=\([^\(\)]+\))|[^\(\)]+$/
pat   = /\([^\)]+(?=\([^\(\)]+\))/
pat_test_1 = /\(.*?\)|(,)/
pat_test_2 = /(?!\(\)),/
p = pat_test_2
b = a.scan(p)
p b
p p
puts b
p hr
p a.split(pat_test_1)

__END__
\(.*?\)|(,)
/(?!\()/
