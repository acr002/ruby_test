
require 'csv'

hr = '-' * 24
table = CSV.read('sample.csv', encoding: 'cp932:utf-8', headers: true)
# a = table.first
p table.headers
p table
# p hr
# p table['key'].compact
# p table['value'].compact
p table['key'].zip(table['value']).to_h
################################


