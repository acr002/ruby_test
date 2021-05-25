
require 'csv'
require 'json'

# csv����Hash�ɕϊ����܂��B
# hash����json�ɂ��܂��B
# windows�Ŏg���鎖��z�肵�Ă���̂ŁAencoding��cp932�Ɏw�肵�Ă��܂��B

# ���� path:    �t�@�C����
# ���� x_key:   key�������Ă����ԍ�(1����n�߂܂�)
# ���� x_value: value�������Ă����ԍ�(1����n�߂܂�)
# hash��key�̓V���{�������Ă��܂��B
def csv_hash(path, x_key = 1, x_value = 2)
  h = Hash.new
  xk = x_key - 1
  xv = x_value - 1
  a = CSV.read(path, encoding: 'cp932:utf-8')
  a.each do |row|
    h[row[xk].to_sym] = row[xv]
  end
  # value�����ׂĔz��Ɏ��ꍇ�͉��L���g�p���Ă��������B
  # �d�������ێ����܂��Barray.first, array.last�ɂėD������߂Ă��ǂ���������܂���B
  # a.each do |row|
  #   h[row[xk].to_sym] ||= Array.new
  #   h[row[xk].to_sym] << row[xv]
  # end
  h
end

def put_json_pg(path, h)
  File.open(path, 'w', encoding: 'cp932') do |f|
    f.puts JSON.pretty_generate(h)
  end
end

h = csv_hash('sample.csv')
p h
put_json_pg('result.json', h)
# puts JSON.pretty_generate(h)
################################

# /\w/  �p����_��\���܂��B
# /\W/  �͉p����_�ȊO��\���܂��B
b = 'test��data_01 '.encode('utf-8')
a = b.strip.upcase
p a.strip.match?(/\W/)
p a.to_sym
################################

# flatten�͐[�����P�̔z��Ɏ��s���Ă����Ȃ������܂����B
a = [1, 2, 3]
p a.flatten.flatten.flatten
################################

# %w()�ł̓X�y�[�X�̘A���͖����A�ϐ��W�J�͂��Ȃ��悤�ł��B
b = 'test data'
a = %w(a b c d e  1 2 3 4 5 #{b})
p a
################################

# nil��to_s�����''�ɂȂ�܂��B
# a = nil
a = ' '
p a.to_s.strip.empty?
################################









