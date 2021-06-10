#-----------------------------------------------------------[date: 2021.06.10]

# require 'H:/lib/works/main.rb'
require 'H:/A/ruby/_github/03 works/try3/lib/main.rb'
require 'pp'

# pp fc
# File.open('result(fc).txt', 'w') do |f|
#   f.puts fc.pretty_inspect
# end

def out_fn(fn)
  "#{File.basename(fn, '.in')}.mcs"
end

log = {}
fc = load_files
# pp fc
buf_size = max_size(fc)
Dir.glob('*.in').each do |fn|
  File.open(out_fn(fn), 'w') do |mcs|
    File.foreach(fn) do |line|
      next if line.strip.empty?
      fc[:line] = line.strip.ljust(buf_size)
      mcs.puts works(fc)
    end
  end
end
# put_log(log)
p 'end of run'


