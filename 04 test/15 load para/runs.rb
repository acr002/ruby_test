
line = File.read('para.txt', encoding: 'cp932:utf-8').split(/\R/)
para = []
line.each do |eline|
  block = eline.split(',').map(&:strip)
  block.each do |eblock|
    # p eblock
    # "if S01.include?(1)"
    # "unless S01.include?(1)"
    # "set S01(1)"
    sect = eblock.split
    # p sect
    # ["if", "S01.include?(1)"]
    # ["unless", "S01.include?(1)"]
    # ["set", "S01(1)"]
    h = {}
    h[:type] = sect.first
    h[:para] = sect[1..nil]
    p h
    # {:type=>"if", :para=>["S01.include?(1)"]}
    # {:type=>"unless", :para=>["S01.include?(1)"]}
    # {:type=>"set", :para=>["S01(1)"]}
  end
end
################################

p [1, 2, 3, 4][2..-1]
p [1, 2, 3, 4][2..nil]
p [1, 2, 3, 4][2..]
################################

a = "if s01.include?(1), if s02.include?(1)".split(',')
p a[1].split
# ["if", "s02.include?(1)"]
################################

a = "        a  b c ".split
p a
# ["a", "b", "c"]
################################







