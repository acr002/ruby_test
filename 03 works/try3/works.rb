#-----------------------------------------------------------[date: 2021.06.14]

require 'pp'
require './lib/main.rb'

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
      fc[:line] = line.rstrip.ljust(buf_size)
      mcs.puts works(fc)
    end
  end
end
# put_log(log)
p 'end of run'


