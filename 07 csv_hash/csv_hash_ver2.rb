

# csv����Hash�ɕϊ����܂��B
# windows�Ŏg���鎖��z�肵�Ă���̂ŁAencoding��cp932�Ɏw�肵�Ă��܂��B
#   ���� path:    �t�@�C����
#   ���� x_key:   key�������Ă����ԍ�(1����n�߂܂�)
#   ���� x_value: value�������Ă����ԍ�(1����n�߂܂�)
#   hash��key�̓V���{�������Ă��܂��B
require 'csv'
def csv_hash(path, x_key = 2, x_value = 3)
  h = Hash.new
  xk = x_key - 1
  xv = x_value - 1
  a = CSV.read(path, encoding: 'cp932:utf-8', headers: true)
  a.each do |row|
    unless row[xk].to_s.strip.empty?
      h[row[xk].to_sym] = row[xv]
    end
  end
  h
end

h = csv_hash('sample.csv', 7, 8)
p h
################################

