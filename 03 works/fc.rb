
require 'pry-byebug'

class FC
  attr_reader :basename
  def initialize
    cur = Dir.pwd
    ar = cur.split('/')
    @basename = ar[1]
  end
end

fc = FC.new
binding.pry
p fc
p fc.basename





__END__

Logger.new()
  DEBUG
  INFO
  WARN
  ERROR
  FATAL
  UNKNOWN
