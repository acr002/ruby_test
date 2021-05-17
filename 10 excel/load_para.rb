
require 'csv'
require 'pp'

class Array
  def uniq?
    (self.size - self.uniq.size).zero?
  end
end

def check_value?(a, sign, b)
  case sign
  when '<'
    a < b
  when '>'
    a > b
  when '<='
    a <= b
  when '>='
    a >= b
  end
end

list = CSV.read('list.csv', headers: true, encoding: 'cp932:utf-8')
# head = list.headers[1..]
# p head

list.each do |row|
  sf.each do |s|
    p "#{s}: #{row[s]}"
  end
end

