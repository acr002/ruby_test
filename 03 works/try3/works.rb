#-----------------------------------------------------------[date: 2021.06.07]

# require 'H:/lib/works/main.rb'
require 'H:/A/ruby/_github/03 works/try3/lib/main.rb'
require 'pp'

fc = load_files
# pp fc
# File.open('result(fc).txt', 'w') do |f|
#   f.puts fc.pretty_inspect
# end

log = {}
fc = load_files
in_fns = Dir.glob('*.in')
in_fns.each do |fn|
  out_fn = "#{File.basename(fn, '.in')}.mcs"
  File.open(out_fn, 'w') do |mcs|
    File.foreach(fn) do |line|
      next if line.strip.empty?
      mcs << works(fc, line)
    end
  end
end
put_log(log)
p 'end of run'


