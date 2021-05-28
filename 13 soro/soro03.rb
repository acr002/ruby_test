
class Array
  def puts_add(a)
    self << a
    puts a
  end
end

def delimited(f)
  a = f.to_s.split('.')
  a[0] = a[0].reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse
  a.join('.')
end

log = Array.new
ans = 0
loop_count = 4
log.puts_add("#{loop_count}.times puts")
start_time = Time.now
loop_count.times do |i|
  a = rand(100)
  ans += a
  # puts delimited(a)
  c = delimited(a).rjust(5)
  log << c
  print c
  gets
end
log.puts_add("time: #{Time.now - start_time}s")
r_ans = gets.to_i
if r_ans == ans
  log_result = 'ok'
else
  log_result = 'ng'
end
log.puts_add("your ans: #{r_ans}")
log.puts_add("calc ans: #{ans}")
log.puts_add("result:   #{log_result}")
log.puts_add('-' * 24)

File.open('result.txt', 'a'){|f| f.puts log}

# gets


