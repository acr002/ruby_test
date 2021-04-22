
require '../00 lib/log.rb'
require '../00 lib/rw_apf.rb'
require './rw_gc.rb'
require './rw_fc.rb'

log = Hash.new
log[:main] = Log.new('main')
gc = load_text
apf = load_apf
path = FC.new
log[:main].sf '[record count]', gc.size
log[:main].sf '[apf count]', apf.size
log[:main].sf '[theme]', 'test'

p apf


log.log_put_csv

__END__
gc.each do |line|
  h[:s01] = line.to_x(:s01)
  h[:s02] = line.to_x(:s02)
  h[:s02].clear if h[:s01].include?(1)
  h[:s01].add(1) unless h[:s02].empty?
end

File.open("#{path.basename}.mcs", 'w'){|f| f.puts gc}




