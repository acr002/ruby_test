
require 'csv'

csv = CSV.table('RDmcs3.csv')
a = csv.headers
p a
p a.size
b = []
a.each do |e|
  b << 
end

# csv.each do |row|
#   ar = []
#   a.each do |e|
#     ar << row[e]
#   end
#   p ar.join('/')
# end




# p csv.size

# csv.each do |e|
#   p "#{e[:sampleno]} #{e[:pref]}"
# end

# File.write('test.csv', csv)







