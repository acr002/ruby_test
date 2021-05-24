
def load_table
  table = {}
  a = File.read('para.txt', encoding: 'cp932:utf-8').split(/\R/)
  a.each do |e|
    b = e.split(',')
    h = {}
    h[:key]   = b[0]
    h[:type]  = b[1]
    h[:value] = b[2].to_i
    table[h[:key]] = h
  end
  table
end

def delimited(f)
  a = f.to_s.split('.')
  a[0] = a[0].reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse
  a.join('.')
end

class Hash
  def kansuuji_to_num(a)
    n  = 0
    na = 0
    nb = 0
    nc = 0
    a.chars.each do |e|
      next unless self.include?(e)
      h = self[e]
      case h[:type]
      when 'A'
        na = (na * 10) + h[:value]
      when 'B'
        na = 1 if na.zero?
        na *= h[:value]
        nb += na
        na = 0
      when 'C'
        nc = nc + ((na + nb) * h[:value])
        na = 0
        nb = 0
      end
      n = na + nb + nc
    end
    n
  end
end

table = load_table()
a = File.read('sample.txt', encoding: 'cp932:utf-8').split(/\R/)
a.each do |e|
  # p e
  b = table.kansuuji_to_num(e)
  p "#{e}: #{delimited(b)}"
end

