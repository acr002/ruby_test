
require 'H:/A\ruby/_github/03 works/01 lib/log.rb'
require 'H:/A\ruby/_github/03 works/01 lib/rw_apf.rb'
require 'H:/A\ruby/_github/03 works/01 lib/rw_gc.rb'
require 'H:/A\ruby/_github/03 works/01 lib/rw_fc.rb'
require 'H:/A\ruby/_github/03 works/01 lib/rw_works.rb'

# log = Hash.new
# log[:main] = Log.new('main')
log = Log.new('main')
gc = load_text
apf = load_apf
path = FC.new
# log[:main].sf '[record count]', gc.size
# log[:main].sf '[apf count]', apf.size
# log[:main].sf '[theme]', 'test'
################################

gc.each do |line|
  sno = line.to_ol(apf[:SNO])
  log.sf sno.apf.x, sno.base, sno.value
  # log[:main].sf line.to_a(apf[:SNO]), line.to_a(apf[:S04])
end
# buf = Gline.new('10001 01112013')
# p buf

log.put_csv

__END__
gc.each do |line|
  h[:s01] = line.to_x(:s01)
  h[:s02] = line.to_x(:s02)
  h[:s02].clear if h[:s01].include?(1)
  h[:s01].add(1) unless h[:s02].empty?
  line.fixer(h)
end

File.open("#{path.basename}.mcs", 'w'){|f| f.puts gc}
log.log_put_csv




