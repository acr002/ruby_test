
def link_to(path_a, path_b)
  ar_a = path_a.split('/')
  ar_b = path_b.split('/')
  loop_a = ar_a.each
  loop_b = ar_b.each
  cn = 0
  same_depth = ar_a.size
  loop do
    cn += 1
    a = loop_a.next
    b = loop_b.next
    unless a == b
      same_depth = cn
      break
    end
  end
  diff = ar_a.size - same_depth
  unless diff.zero?
    back_path = '../' * diff
    to_path = ar_b[(diff)..-1].join('/')
    back_path + to_path
  else
    ar_b[(ar_a.size - 1)..-1].join('/')
  end
end

# a = "C:/a/b/c/d/e/f"
a = "C:/a/b"
b = "C:/a/b/s/g/e"
c = link_to(a, b)
p a, b, c
################################




