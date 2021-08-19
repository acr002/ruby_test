# coding: cp932

def seach_key(list, key)
  a = []
  list.each do |e|
    a << e if e.first.include?(key)
  end
  a
end



list_a = File.read('list02.txt', encoding: 'cp932:utf-8').split(/\R/)
list = list_a.map{_1.split(/\t/)}
# p list

key = '田'.encode('utf-8')
result = seach_key(list, key)
p result





