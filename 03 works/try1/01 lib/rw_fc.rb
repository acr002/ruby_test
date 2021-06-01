
class FC
  attr_reader :basename
  def initialize
    cur = Dir.pwd
    ar = cur.split('/')
    @basename = ar[1]
  end
end

