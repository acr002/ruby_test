
# Dir.globの引数
# '*'   フォルダも含めます。
# '*.*' ファイルだけになるようです。
fns = Dir.glob('*.*')
fns_ext = fns.map{File.extname(_1)}.tally
p fns, fns.size
p fns_ext
################################

