
line = File.read('para.txt', encoding: 'cp932:utf-8').split(/\R/)
para = []
line.each do |eline|
  block = eline.split(',').map(&:strip)
  block.each do |eblock|
    sect = eblock.split
    h = {}
    h[:type] = sect.first
    h[:para] = sect[1..nil]
    p h
  end
end
################################
