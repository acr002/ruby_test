# coding: windows-31j
# 2020.07.17(金)

def hr
  '-' * 32
end
def delimited(f)
  a = f.to_s.split('.')
  a[0] = a[0].reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse
  a.join('.')
end

# n:   口数
# len: 桁数
n = 3
len = 2
mon = 10

File.open('mon.txt', 'w') do |f|
  mon.times do
    b = 0
    ar = []
    n.times do
      a = rand(1..(10 ** len))
      b += a
      ar << a.to_s.rjust(len + 1)
      # puts a.to_s.rjust(len + 1)
    end
    f.puts ar
    f.puts hr
    f.puts b.to_s.rjust(32)
  end
  # puts "ans: #{delimited(b)}"
end












