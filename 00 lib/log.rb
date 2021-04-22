require 'csv'

class Log
  @@hr = '-' * 36
  @@serial = 0
  def initialize(name = '')
    @@serial += 1
    @head = []
    @a = []
    @cn = 0
    @max_el = 0
    @name = "#{@@serial} #{name}"
    @head << "[file] #{File.basename(__FILE__)}"
    @head << %([start] #{Time.now.strftime("%Y.%m.%d %H:%M:%S")})
  end

  def sf(*a)
    @cn += 1
    @max_el = a.size if a.size > @max_el
    a.unshift("#{@cn}")
    # @a << a.map(&:to_s).join("\t")
    @a << a
  end

  def put_text(filename = "log(#{@name}).txt")
    @head << %([end]   #{Time.now.strftime("%Y.%m.%d %H:%M:%S")})
    @head << "[logs count] #{@cn}"
    @head << @@hr
    File.open(filename, 'w')do |f|
      f.puts @head
      f.puts ''
      @a.each do |e|
        f.puts e.map(&:to_s).join("\t")
      end
    end
  end

  def put_csv(filename = "log(#{@name}).csv")
    header = (1..@max_el).map{|e| "el_#{e}"}
    header.unshift('seq')
    CSV.open(filename, 'w') do |csv|
      csv.puts header
      @a.each{|e| csv.puts e}
    end
  end
end

class Hash
  def log_put_csv
    self.each{|k, v| v.put_csv}
  end

  def log_put_text
    self.each{|k, v| v.put_text}
  end

  def log_put
    self.each do |k, v|
      v.put_csv
      v.put_text
    end
  end
end

__END__
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
# log.each{|k, v| v.put_text}


