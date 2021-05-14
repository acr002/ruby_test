

require 'csv'

csv = CSV.read('RDmcs3.csv', headers: true)

p csv.headers
################################

csv.each do |y|
  p y["SampleNo."]
end
################################








