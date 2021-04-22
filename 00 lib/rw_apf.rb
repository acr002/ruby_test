
################################
# apf
################################
# keyは大文字のsymbolです。

class APF
  attr_accessor :key, :x, :size, :cts, :limit, :type, :comment, :decimal, :range

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
  apf
end
################################

def check_sno(apf)
  unless apf.include?(:SNO)
    apf_new = APF.new
    apf_new.key     = :SNO
    apf_new.x       = 1
    apf_new.size    = 5
    apf_new.limit   = 1
    apf_new.comment = 'SampleNo.'
    apf_new.type    = 'R'
    apf_new.decimal = 0
    apf_new.range   = 5
    apf[:SNO] = apf_new
  end
end
################################

