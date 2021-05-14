
sql = 'INSERT INTO shop(name, category) VALUES(:name, :category)'
db.execute(sql, :category => @category, :name => @shop)

sq = 'SELECT * FROM shop'
db.close

