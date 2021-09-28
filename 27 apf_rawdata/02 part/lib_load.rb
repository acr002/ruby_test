
class String
  def sf!(apf, ar)
    case apf[:type]
    when 'R'
      buf = ar.first.to_s.rjust(apf[:size])[0, apf[:size]]
    else
      buf = ar[0, apf[:limit]].map{_1.to_s.rjust(apf[:size], '0')[0, apf[:size]]}.join
    end
    a = self[apf[:x] - 1, buf.size]
    unless a.strip.empty?
      p "updata! #{apf[:key]}: before[#{a}] new[#{buf}]"
    end
    self[apf[:x] - 1, buf.size] = buf
    buf
  end

  def sf(apf, ar)
    a = self.clone
    a.sf!(apf, ar)
  end
end
################################

# def load_apf(fn)
#   apf = {}
#   File.foreach(fn, encoding: 'cp932') do |li|
#     next if li.strip.empty?
#     a = li.strip
#     aa = a.upcase
#     next unless aa[1, 2] == 'OL'
#     h = {}
#     h[:key]     = aa[ 3, 3].strip
#     h[:x]       = aa[ 6, 4].to_i
#     h[:size]    = aa[10, 1].to_i
#     h[:cts]     = aa[11, 2].to_i
#     h[:limit]   = aa[14, 2].to_i
#     h[:comment] = a[17, 17].strip
#     h[:type]    = aa[34, 1].strip
#     h[:limit] = 1 if h[:limit].zero?
#     h[:range] = h[:size] * h[:limit]
#     apf[h[:key]] = h
#   end
#   apf
# end
# ################################

def set_sno
  sno = {}
  sno[:key]     = 'SNO'
  sno[:x]       = 1
  sno[:size]    = 5
  sno[:cts]     = 0
  sno[:limit]   = 1
  sno[:comment] = 'SampleNo.'
  sno[:type]    = 'R'
  sno[:range] = sno[:size] * sno[:limit]
  sno
end
################################

def apf_length(apf)
  max = 0
  apf.each do |k, v|
    a = v[:x] + v[:range] - 1
    max = a if max < a
  end
  ((max - 1).div(100) + 1) * 100
end
################################

