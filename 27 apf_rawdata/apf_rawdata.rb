
# apf load
# puts text

def load_apf
  apf = {}
  Dir.glob('*.apf') do |fn|
    File.foreach(fn, encoding: 'cp932') do |li|
      next if li.strip.empty?
      a = li.strip
      aa = a.upcase
      next unless aa[1, 2] == 'OL'
      h = {}
      h[:key]     = aa[ 3, 3].strip
      h[:x]       = aa[ 6, 4].to_i
      h[:size]    = aa[10, 1].to_i
      h[:cts]     = aa[11, 2].to_i
      h[:limit]   = aa[14, 2].to_i
      h[:comment] = a[17, 17].strip
      h[:type]    = aa[34, 1].strip
      h[:limit] = 1 if h[:limit].zero?
      h[:range] = h[:size] * h[:limit]
      apf[h[:key]] = h
    end
  end
  apf
end

def apf_length(apf)
  max = 0
  apf.each do |k, v|
    a = v[:x] + v[:range] - 1
    max = a if max < a
  end
  ((max - 1).div(100) + 1) * 100
end

class String
  def sf(buf, x)
    self[x, buf.size] = buf
  end
end

apf = load_apf
max = apf_length(apf)
p max
__END__

col = []

apf.each do |k, v|
  ar = (1..v[:limit]).to_a



  end
end

# text の設置方法はsliceを使う。

# 最小値を出力
# 最大値を出力
# 全パターンは不要？



