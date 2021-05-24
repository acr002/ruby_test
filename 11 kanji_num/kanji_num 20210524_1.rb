# coding: cp932

class KanjiNum
  @@table = {}
  def initialize(type, value)
    @type = type
    @value = value
    load_key
  end

  def load_key
    @@table['一'.encode('utf-8')] = KanjiNum.new('A', 1)
    @@table['二'.encode('utf-8')] = KanjiNum.new('A', 2)
    @@table['三'.encode('utf-8')] = KanjiNum.new('A', 3)
    @@table['四'.encode('utf-8')] = KanjiNum.new('A', 4)
    @@table['五'.encode('utf-8')] = KanjiNum.new('A', 5)
    @@table['六'.encode('utf-8')] = KanjiNum.new('A', 6)
    @@table['七'.encode('utf-8')] = KanjiNum.new('A', 7)
    @@table['八'.encode('utf-8')] = KanjiNum.new('A', 8)
    @@table['九'.encode('utf-8')] = KanjiNum.new('A', 9)
    @@table['拾'.encode('utf-8')] = KanjiNum.new('B', 10)
    @@table['十'.encode('utf-8')] = KanjiNum.new('B', 10)
    @@table['百'.encode('utf-8')] = KanjiNum.new('B', 100)
    @@table['千'.encode('utf-8')] = KanjiNum.new('B', 1000)
    @@table['万'.encode('utf-8')] = KanjiNum.new('C', 10000)
    @@table['萬'.encode('utf-8')] = KanjiNum.new('C', 10000)
    @@table['億'.encode('utf-8')] = KanjiNum.new('C', 100000000)
    @@table['零'.encode('utf-8')] = KanjiNum.new('A', 0)
    @@table['〇'.encode('utf-8')] = KanjiNum.new('A', 0)
    @@table['壱'.encode('utf-8')] = KanjiNum.new('A', 1)
    @@table['弐'.encode('utf-8')] = KanjiNum.new('A', 2)
    @@table['参'.encode('utf-8')] = KanjiNum.new('A', 3)
    @@table['伍'.encode('utf-8')] = KanjiNum.new('A', 5)
    @@table['１'.encode('utf-8')] = KanjiNum.new('A', 1)
    @@table['２'.encode('utf-8')] = KanjiNum.new('A', 2)
    @@table['３'.encode('utf-8')] = KanjiNum.new('A', 3)
    @@table['４'.encode('utf-8')] = KanjiNum.new('A', 4)
    @@table['５'.encode('utf-8')] = KanjiNum.new('A', 5)
    @@table['６'.encode('utf-8')] = KanjiNum.new('A', 6)
    @@table['７'.encode('utf-8')] = KanjiNum.new('A', 7)
    @@table['８'.encode('utf-8')] = KanjiNum.new('A', 8)
    @@table['９'.encode('utf-8')] = KanjiNum.new('A', 9)
    @@table['0'.encode('utf-8')]  = KanjiNum.new('A', 0)
    @@table['1'.encode('utf-8')]  = KanjiNum.new('A', 1)
    @@table['2'.encode('utf-8')]  = KanjiNum.new('A', 2)
    @@table['3'.encode('utf-8')]  = KanjiNum.new('A', 3)
    @@table['4'.encode('utf-8')]  = KanjiNum.new('A', 4)
    @@table['5'.encode('utf-8')]  = KanjiNum.new('A', 5)
    @@table['6'.encode('utf-8')]  = KanjiNum.new('A', 6)
    @@table['7'.encode('utf-8')]  = KanjiNum.new('A', 7)
    @@table['8'.encode('utf-8')]  = KanjiNum.new('A', 8)
    @@table['9'.encode('utf-8')]  = KanjiNum.new('A', 9)
  end

  def self.to_num(a)
    na = 0
    nb = 0
    nc = 0
    a.size.times do |i|
      next unless @@table.include?(a[i])
      t = @@table[a[i]]
      case t.type
      when 'A'
        na = (na * 10) + t.value
      when 'B'
        na = 1 if na.zero?
        na *= t.value
        nb += na
        na = 0
      when 'C'
        nc = nc + ((na + nb) * t.value)
        na = 0
        nb = 0
      end
    end
    na + nb + nc
  end
end

def load_table
  h = {}
end

# h = load_key

# p h
# h.each do |k, v|
#   p "#{k}: (#{v.type})#{v.value}"
# end

a = File.read('sample.txt', encoding: 'cp932:utf-8').split(/\R/)
a.each do |e|
  p "#{e}: #{KanjiNum.to_num(e)}"
end

