
def choice8(ar)
  *a, b, c = ar
  # p a
  # p a.sample(6)
  # p b
  # p c
  # a.sample(6) + [b] + [c]
  a.uniq!
  [c] + [b] + a.sample(4)
end

# a = %w(test data smoke date kiss look pc book 01 02 03 03 03 03 04 04)
a = %w(02 03 03 03 03 04 04)
# eighth
b = choice8(a)
p b






