

def set_hash1(a)
  h = {}
  h[:string] = []
  h[:integer] = []
  h[:other] = []
  a.each do |e|
    case e
    when String
      h[:string] << e
    when Integer
      h[:integer] << e
    else
      h[:other] << e
    end
  end
  h
end

def set_hash2(h, a)
  h[:string]  ||= []
  h[:integer] ||= []
  h[:other]   ||= []
  a.each do |e|
    case e
    when String
      h[:string] << e
    when Integer
      h[:integer] << e
    else
      h[:other] << e
    end
  end
end

a = [1, 2, 'a', 3, 4, 'b']
# h = set_hash1(a)
h = {}
set_hash2(h, a)
p h
b = [5, 'x', 6, 'y', 7, 'z']
set_hash2(h, b)
p h
set_hash2(h, [3.2])
p h
################################






