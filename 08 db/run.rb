
require 'sqlite3'

SQLite3::Database.new('test.db') do |db|
  gc = db.execute('select * from rd')
  gc.each do |e|
    p e
  end
end

