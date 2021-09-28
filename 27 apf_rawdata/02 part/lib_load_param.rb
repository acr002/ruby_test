
def load_param
  ar = []
  Dir.glob('param*.txt') do |fn|
    File.foreach(fn, encoding: 'cp932') do |line|
      next if line.strip.empty?
      next if line.strip.start_with?('#')
      a = line.split(',').map(&:strip)
      h = {}
      h[:main] = a.first.to_sym
      h[:sub] = a[1..nil]
      ar << h
    end
  end
  ar
end
################################

def load_apf_all
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
################################


