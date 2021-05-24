# coding: cp932

class KanjiNum
  @@table = {}
  def initialize(type, value)
    @type = type
    @value = value
    load_key
  end

  def load_key
    @@table['��'.encode('utf-8')] = KanjiNum.new('A', 1)
    @@table['��'.encode('utf-8')] = KanjiNum.new('A', 2)
    @@table['�O'.encode('utf-8')] = KanjiNum.new('A', 3)
    @@table['�l'.encode('utf-8')] = KanjiNum.new('A', 4)
    @@table['��'.encode('utf-8')] = KanjiNum.new('A', 5)
    @@table['�Z'.encode('utf-8')] = KanjiNum.new('A', 6)
    @@table['��'.encode('utf-8')] = KanjiNum.new('A', 7)
    @@table['��'.encode('utf-8')] = KanjiNum.new('A', 8)
    @@table['��'.encode('utf-8')] = KanjiNum.new('A', 9)
    @@table['�E'.encode('utf-8')] = KanjiNum.new('B', 10)
    @@table['�\'.encode('utf-8')] = KanjiNum.new('B', 10)
    @@table['�S'.encode('utf-8')] = KanjiNum.new('B', 100)
    @@table['��'.encode('utf-8')] = KanjiNum.new('B', 1000)
    @@table['��'.encode('utf-8')] = KanjiNum.new('C', 10000)
    @@table['��'.encode('utf-8')] = KanjiNum.new('C', 10000)
    @@table['��'.encode('utf-8')] = KanjiNum.new('C', 100000000)
    @@table['��'.encode('utf-8')] = KanjiNum.new('A', 0)
    @@table['�Z'.encode('utf-8')] = KanjiNum.new('A', 0)
    @@table['��'.encode('utf-8')] = KanjiNum.new('A', 1)
    @@table['��'.encode('utf-8')] = KanjiNum.new('A', 2)
    @@table['�Q'.encode('utf-8')] = KanjiNum.new('A', 3)
    @@table['��'.encode('utf-8')] = KanjiNum.new('A', 5)
    @@table['�P'.encode('utf-8')] = KanjiNum.new('A', 1)
    @@table['�Q'.encode('utf-8')] = KanjiNum.new('A', 2)
    @@table['�R'.encode('utf-8')] = KanjiNum.new('A', 3)
    @@table['�S'.encode('utf-8')] = KanjiNum.new('A', 4)
    @@table['�T'.encode('utf-8')] = KanjiNum.new('A', 5)
    @@table['�U'.encode('utf-8')] = KanjiNum.new('A', 6)
    @@table['�V'.encode('utf-8')] = KanjiNum.new('A', 7)
    @@table['�W'.encode('utf-8')] = KanjiNum.new('A', 8)
    @@table['�X'.encode('utf-8')] = KanjiNum.new('A', 9)
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

