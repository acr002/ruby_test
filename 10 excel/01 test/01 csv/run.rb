# coding: cp932

=begin
  c = CSV.read�ł�headers: true��csv::table���Ԃ�܂��B
  c.headers�Ńw�b�_��Ԃ��܂��B(Array)
  c.each�Œʏ��CSV::row���u���b�N�Ŏ擾�ł��܂��B
  row��each�����[�w�b�_, �l]��array�̌`�Ŏ擾�ł��܂��B
  array�ł����Ahash�̂悤��row[key]�̌`�Œl�݂̂��擾���邱�Ƃ��ł��܂��B
=end



require 'csv'

class Array
  def uniq?
    (self.size - self.uniq.size).zero?
  end
end

csv = CSV.read('test.csv', headers: true, encoding: 'cp932:utf-8')
a = csv.headers

# csv.each do |row|
#   csv.headers.each do |e|
#     p "#{e} #{row[e]}"
#   end
# end

id = 'id'
key = 's3'

p "#{id}���g����#{key}�̒l��񋓂��܂��B".encode('utf-8')
csv.each do |row|
  # p row
  # p row.class
  p "id[#{row[id]}] #{row[key]}"
  # row.each do |e|
  #   p e
  #   p e.class
  # end
end

# a = %w(a b c d e a f g)
# a = %w(a b c d e f g)
# p a
# if a.uniq?
#   p 'yes, uniq only'
# else
#   p 'no, www'
# end

