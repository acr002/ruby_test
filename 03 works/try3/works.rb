#-----------------------------------------------------------[date: 2021.06.14]

require 'pp'
require './lib/main.rb'

def out_fn(fn)
  "#{File.basename(fn, '.in')}.mcs"
end

fc = load_files
buf_size = max_size(fc)
Dir.glob('*.in').each do |fn|
  File.open(out_fn(fn), 'w') do |mcs|
    File.foreach(fn) do |line|
      next if line.strip.empty?
      fc[:line] = line.rstrip.ljust(buf_size)
      # fc[:SNO] = fc[:line][0, 5]
      mcs.puts works(fc)
    end
  end
end
# put_log(log)
puts 'end of run'


