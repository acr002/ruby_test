# coding: cp932

=begin
  c = CSV.readではheaders: trueでcsv::tableが返ります。
  c.headersでヘッダを返します。(Array)
  c.eachで通常はCSV::rowをブロックで取得できます。
  rowをeachすると[ヘッダ, 値]のarrayの形で取得できます。
  arrayですが、hashのようにrow[key]の形で値のみを取得することもできます。
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

p "#{id}を使って#{key}の値を列挙します。".encode('utf-8')
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

