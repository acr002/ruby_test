
# Dir.globの引数
# '*'   フォルダも含めます。
# '*.*' ファイルだけになるようです。
fns = Dir.glob('*.*')
fns_ext = fns.map{File.extname(_1)[1..nil].to_sym}.tally
# pp fns, fns.size
# p fns_ext

# key = :txt
key = :rb
re = fns_ext[key]
if re.nil?
  puts "#{key} is nothing"
else
  puts "#{key} has #{re}"
end
# p fns_ext.has_key?(:rb)
################################

