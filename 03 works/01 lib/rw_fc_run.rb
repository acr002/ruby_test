# coding: cp932

# require 'pry-byebug'
require 'H:\A\ruby\00 lib/log.rb'

class FC
  attr_reader :basename
  def initialize
    cur = Dir.pwd
    ar = cur.split('/')
    @basename = ar[1]
  end
end

fc = FC.new
# log = Log.new('test')
# # binding.pry
# log.sf fc
# # p fc
# # p fc.basename
# 9.times do |i|
#   log.sf "test #{i + 1}"
# end
# log.sf 'できるかな？', 9, 3, 'test'
# log.put_csv

log = {}
log[:a] = Log.new('a')
log[:b] = Log.new('b')
log[:c] = Log.new('c')
log[:a].sf 'log test'
log[:b].sf fc
9.times do |i|
  log[:c].sf "test #{i + 1}"
end
log.log_put_csv




__END__

Logger.new()
  DEBUG
  INFO
  WARN
  ERROR
  FATAL
  UNKNOWN
