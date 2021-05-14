
require 'csv'
require 'sqlite3'

sf = CSV.table('RDmcs3.csv')
db = SQLite3::Database.new('test.db')
sql = "create table rd (#{sf.headers.map{|e| "#{e} integer"}.join(',')});"
db.execute(sql)

db.transaction do
  sf.each do |row|
    sf.headers.each do |e|
      sql = "insert into rd (#{e}) values (?)"
      db.execute(sql, row[e])
    end
  end
end

db.close

