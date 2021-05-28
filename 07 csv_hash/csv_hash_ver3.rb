
require 'csv'

# hr = '-' * 24
table = CSV.read('sample.csv', encoding: 'cp932:utf-8', headers: true)
a = table.headers
p a[0]
p a[1]
p a[2]
p a[3]
p a[4]
# p table.headers
# p table
# p hr
# p table['key'].compact
# p table['value'].compact
# p table[7]
# p table[7].zip(table[8]).to_h
p table['key'].zip(table['value']).to_h
################################


