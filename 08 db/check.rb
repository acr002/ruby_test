
require 'sqlite3'

db = SQLite3::Database.new('test.db')
tbls = db.execute('SELECT * FROM sqlite_master')
p tbls



