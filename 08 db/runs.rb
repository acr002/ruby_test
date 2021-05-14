
sql = 'INSERT INTO shop(name, category) VALUES(:name, :category)'
db.execute(sql, :category => @category, :name => @shop)

sq = 'SELECT * FROM shop'
db.close
################################

# file‚Ìread
f = File.read('runs.rb').split(/\R/)
p f.class
puts f
################################








