

def delimited(f)
  a = f.to_s.split('.')
  a[0] = a[0].reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse
  a.join('.')
end

# puts delimited(rand(100000000))
# __END__

loop do
  a = rand(4..11)
  b = 10 ** a
  puts delimited(rand(b))
  puts 'exit: num'
  st = Time.now
  rr = gets.to_i
  if rr.zero?
    # puts "time #{Time.now - st}s"
  else
    break
  end
end



