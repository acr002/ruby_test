
################################
# apf
################################
# key‚Í‘å•¶š‚Ìsymbol‚Å‚·B

class APF
  attr_reader :key, :x, :size, :cts, :limit, :type, :comment, :decimal, :range

  def set_line(key, line)
    @key     = key
    @x       = line[6, 4].to_i
    @size    = line[10, 1].to_i
    @cts     = line[11, 2].to_i
    @limit   = line[14, 2].to_i
    @limit   = 1 if limit.zero?
    @comment = line[17, 17].strip
    @type    = line[34, 1].strip.upcase
    @decimal = line[56, 1].to_i if type == 'R'
    @range   = size * limit
    self
  end

  def set_hash(h)
    @key     = h[:key]     unless h[:key].nil?
    @x       = h[:x]       unless h[:x].nil?
    @size    = h[:size]    unless h[:size].nil?
    @cts     = h[:cts]     unless h[:cts].nil?
    @limit   = h[:limit]   unless h[:limit].nil?
    @comment = h[:comment] unless h[:comment].nil?
    @type    = h[:type]    unless h[:type].nil?
    @decimal = h[:decimal] unless h[:decimal].nil?
    @range   = h[:range]   unless h[:range].nil?
    self
  end
end
################################

def load_apf(path = Dir.pwd + '/*.apf')
  fns = Dir.glob(path)
  apf = Hash.new
  fns.each do |fn|
    File.foreach(fn, encoding: 'cp932:utf-8') do |line|
      a = line.strip
      next if a.empty?
      next unless a.upcase.start_with?(/.OL/)
      key = line[3, 3].upcase.to_sym
      apf[key] = APF.new.set_line(key, a)
    end
  end
  check_sno(apf)
  apf
end
################################

def check_sno(apf)
  unless apf.include?(:SNO)
    h = Hash.new
    h[:key]     = :SNO
    h[:x]       = 1
    h[:size]    = 5
    h[:limit]   = 1
    h[:comment] = 'SampleNo.'
    h[:type]    = 'R'
    h[:decimal] = 0
    h[:range]   = 5
    apf[:SNO] = APF.new.set_hash(h)
  end
end
################################

