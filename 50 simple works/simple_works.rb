
require 'csv'
require 'pp'

# textを簡単に修正できるプログラムを作成します。
# また、確認できるものも欲しいです。

# APFデータを使用します。
# inファイルはカレントにあるinファイルを使い、すべてのinを対象とします。
# 出力はファイル名をそのままにし、拡張子を.mcsに変更します。


class String
  # 値を取得する
  def value(apf)
    ar = []
    buf = self[apf[:x] - 1, apf[:range]].strip
    apf[:limit].times do |i|
      a = buf[i * apf[:size], apf[:size]].to_i
      ar << a unless a.zero?
    end
    ar
  end

  # 値を出力する
  # 文字列を渡してください。配列はArray#to_bufを使用して文字列化してください。
  # base_string.midre(buf, apf[key])
  # 右寄せ(RA)の場合はmidre_lを使用してください。
  def midre(buf, apf)
    x = apf[:x] - 1
    range = apf[:range]
    a = buf[0, range]
    self[x, range] = a.ljust(range)
  end

  def midre_l(buf, apf)
    x = apf[:x] - 1
    size = apf[:size]
    a = buf[0, size]
    self[x, size] = a.rjust(size)
  end
end

class Array
  # buf = base_array.to_buf(apf[key])
  # 実数(RA)の場合はpaddingの指定もしてください。
  def to_buf(apf, padding = '0')
    self.map{_1.to_s.rjust(apf[:size], padding)}.join
  end

  # 以下はapfではなく数値を指定する場合。
  # def to_buf(width = 1, padding = '0')
  #   self.map{_1.to_s.rjust(width, padding)}.join
  # end
end

def load_apf(path = Dir.pwd)
  apf = {}
  Dir.glob(path + '/*.apf') do |fn|
    File.foreach(fn, encoding: 'cp932') do |line|
      a = line.strip
      next if a.empty?
      b = a.upcase
      next unless b[1, 2] == 'OL'
      h = {}
      h[:key]     = b[3, 3].strip.to_sym
      h[:x]       = b[6, 4].to_i
      h[:size]    = b[10, 1].to_i
      h[:cts]     = b[11, 2].to_i
      h[:limit]   = b[14, 2].to_i
      h[:comment] = a[17, 17].strip
      h[:type]    = b[34, 1].strip.to_sym
      h[:limit] = 1 if h[:limit].zero?
      h[:range]   = h[:size] * h[:limit]
      apf[h[:key]] = h
    end
  end
  apf
end
################################

def put_log(ar, path = 'result.csv')
  element_count = ar.map{_1.size}.max
  header = (1..element_count).to_a.map{"parts_#{_1}"}
  id_num = 0
  CSV.open(path, 'w') do |c|
    c << %w(id).concat(header)
    ar.each do |e|
      id_num += 1
      c << e.unshift(id_num)
    end
  end
end
################################


apf = load_apf
log = []

# <log test>
# log << %w(key size type range)
# apf.each do |k, ap|
#   log << [ap[:key], ap[:size], ap[:type], ap[:range]]
# end
# put_log(log, 'log(apf).csv')


Dir.glob('*.in') do |fn|
  File.foreach(fn) do |line|
    a = line.value(apf[:M01])
    if a.include?(12)
      b = a.dup
      b.delete(12)
      # log << [line.value(apf[:SNO]), a.to_buf(apf[:M01])]
      log << [line.value(apf[:SNO]), a, b]
    end
  end

  # fn_out = "#{File.basename(fn, '.*')}.mcs"
  # p fn_out
  # File.open(fn_out, 'w'){_1.puts col}
end
put_log(log, 'test log(M01 1).csv')



