
require 'sqlite3'

db = SQLite3::Database.new('test.db')

sql = 'create table users (id integer primary key, name text);'
db.execute(sql)

db.execute('insert into users (name) values (?)', 'maruvi')
db.execute('insert into users (name) values (?)', 'sfc')

db.execute('select * from users') do |row|
  p row
end



