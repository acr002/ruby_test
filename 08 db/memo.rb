
# 実行スピードを上げるため
db.transaction do
  ar.each do |e|
    db.execute()
  end
end

transactionをブロックにしない場合は、commitかrollbackで閉じます。
db.transaction
ar.each do
  db.execute()
end
db.commit
# db.rollback


# テーブルの作成
sql = <<SQL
CREATE TABLE test_table (
  フィールド名 データ型 ［制約］,
  フィールド名 データ型 ［制約］);
SQL

フィールドはカンマで区切ります。最後にはつけません。

制約
  NOT NULL      - null を値として入れられなくなる
  PRIMARY KEY   - テーブルの主となるフィールド
  AUTOINCREMENT - 新しいレコードが追加されると、最後のレコードの値に１がつかされた値が自動で入るようになる。integer を定義したる場合にだけ使える
  UNIQUE        - 同じ値を持ったレコードを追加できなくなる
  DEFAULT       - デフォルト値を設定できる。これを書いたすぐ後にデフォルト値を指定する
  CHECK         - CHECK(条件) に当てはまるレコードだけが追加できるようになる

integerを指定し、AUTOINCREMENTを定義すればseqとなります。
id integer PRIMARY KEY AUTOINCREMENT
ただ、sqliteにはROWIDがあります。
db.execute('select * from table where rowid == 3')


# テーブルの取得
db.execute('select *from sqlite_master')
tb = db.execute("select tbl_name from sqlite_master where type == 'table'")
p tb.flatten!
tb.include?('address_book')

# テーブル内の情報
table_info(テーブル名)

x = []
db.table_info('test_data') do |row|
  x << row['name']
end


# フィールドの追加
ALTER TABLE テーブル名 ADD フィールド名 データ型
db.execute('ALTER TABLE address_book ADD COLUMN cell_num text')

# テーブル名の変更
ALTER TABLE テーブル名 RENAME TO 新テーブル名
db.execute('alter table address_book rename to address_database')


