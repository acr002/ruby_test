
# ���s�X�s�[�h���グ�邽��
db.transaction do
  ar.each do |e|
    db.execute()
  end
end

transaction���u���b�N�ɂ��Ȃ��ꍇ�́Acommit��rollback�ŕ��܂��B
db.transaction
ar.each do
  db.execute()
end
db.commit
# db.rollback


# �e�[�u���̍쐬
sql = <<SQL
CREATE TABLE test_table (
  �t�B�[���h�� �f�[�^�^ �m����n,
  �t�B�[���h�� �f�[�^�^ �m����n);
SQL

�t�B�[���h�̓J���}�ŋ�؂�܂��B�Ō�ɂ͂��܂���B

����
  NOT NULL      - null ��l�Ƃ��ē�����Ȃ��Ȃ�
  PRIMARY KEY   - �e�[�u���̎�ƂȂ�t�B�[���h
  AUTOINCREMENT - �V�������R�[�h���ǉ������ƁA�Ō�̃��R�[�h�̒l�ɂP�������ꂽ�l�������œ���悤�ɂȂ�Binteger ���`������ꍇ�ɂ����g����
  UNIQUE        - �����l�����������R�[�h��ǉ��ł��Ȃ��Ȃ�
  DEFAULT       - �f�t�H���g�l��ݒ�ł���B�����������������Ƀf�t�H���g�l���w�肷��
  CHECK         - CHECK(����) �ɓ��Ă͂܂郌�R�[�h�������ǉ��ł���悤�ɂȂ�

integer���w�肵�AAUTOINCREMENT���`�����seq�ƂȂ�܂��B
id integer PRIMARY KEY AUTOINCREMENT
�����Asqlite�ɂ�ROWID������܂��B
db.execute('select * from table where rowid == 3')


# �e�[�u���̎擾
db.execute('select *from sqlite_master')
tb = db.execute("select tbl_name from sqlite_master where type == 'table'")
p tb.flatten!
tb.include?('address_book')

# �e�[�u�����̏��
table_info(�e�[�u����)

x = []
db.table_info('test_data') do |row|
  x << row['name']
end


# �t�B�[���h�̒ǉ�
ALTER TABLE �e�[�u���� ADD �t�B�[���h�� �f�[�^�^
db.execute('ALTER TABLE address_book ADD COLUMN cell_num text')

# �e�[�u�����̕ύX
ALTER TABLE �e�[�u���� RENAME TO �V�e�[�u����
db.execute('alter table address_book rename to address_database')


