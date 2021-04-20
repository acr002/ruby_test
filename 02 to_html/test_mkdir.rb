
# 2021.04.19(月)
# Dir.mkdir(name)でフォルダを作成します。
# 既にフォルダが存在する場合はエラーになります。
a = %w(a1 a2 b3 c1)
a.each do |e|
  Dir.mkdir(e) unless Dir.exist?(e)
end
################################


