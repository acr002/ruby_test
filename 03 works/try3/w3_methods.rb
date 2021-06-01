
def method_arg(a)
  pat = /([^\(]+)\(([^\)]+)\)/
  b, c = a.scan(pat).flatten
  # c = [] if c.nil?
  ar = load_arg(c)
  [b, ar]
end

# varliable���K�v�����B
# �w�肳�ꂽ�����́A�����Arange�A�ϐ��A�萔���������ڋL�q�����\��������܂��B
def load_arg(arg)
  ar = []
  a = arg.split
  a.each do |b|
    if b.include?('..')
      c = b.split('..')
      ar.concat(Range.new(c.first, c.last).to_a)
    end
    if b.match?(/[0-9]+/)
      ar << b.to_i
    end
  end
  ar
end

a = '1 3..7'
p load_arg(a)


