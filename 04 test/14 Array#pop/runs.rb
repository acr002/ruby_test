
a = []
a << 'if'
a << 'set'
a << 'log'
a << 'delete'
a << 'include?'
cn = 0
p a

loop do
  p "#{cn += 1}: #{a.pop}"
  break if a.empty?
end
################################

a = %w(if include? set delete log)
a.each{ p _1 }
################################







