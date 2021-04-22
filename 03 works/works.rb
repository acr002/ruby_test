
require '../00 lib/rw_apf.rb'
require './rw_gc.rb'
require './rw_fc.rb'

gc = load_text
apf = load_apf
path = FC.new

gc.each do |line|
  h[:s01] = line.to_x(:s01)
  h[:s02] = line.to_x(:s02)
  h[:s02].clear if h[:s01].include?(1)
  h[:s01].add(1) unless h[:s02].empty?
end

File.open("#{path.basename}.mcs", 'w'){|f| f.puts gc}




