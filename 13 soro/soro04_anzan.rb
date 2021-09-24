
def set_ar(x = 2, y = 3)
  max = ('9' * x).to_i
  Array.new(y).map{rand(1..max)}
end

# a = set_ar(1, 2)
# puts a
# puts '-' * 24
# b = gets.to_i
# ans = a.sum
# if b == ans
#   puts "ok, #{ans}"
# else
#   puts "no, #{ans}"
# end

loop do
  a = set_ar(1, 2)
  puts a
  puts '-' * 24
  b = gets.to_i
  ans = a.sum
  if b == ans
    puts "ok, #{ans}"
  else
    puts "no, #{ans}"
  end
  break if gets.strip.size.zero?
end
