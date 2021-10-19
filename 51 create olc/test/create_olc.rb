
require 'pp'

def load_apf(path = Dir.pwd)
  apf = {}
  Dir.glob(path + '/*.apf') do |fn|
    File.foreach(fn, encoding: 'cp932') do |line|
      a = line.strip
      next if a.empty?
      b = a.upcase
      # next unless b.start_with?('COL')
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

def apf_length(apf)
  max = 0
  apf.each do |k, v|
    a = v[:x] + v[:range] - 1
    max = a if max < a
  end
  ((max - 1).div(100) + 1) * 100
end
################################

def sept_chars_size(buf, size)
  a = buf.split('_')
  result = a.map do |e|
    x = e.chars
    x.each_slice(size).map(&:join)
  end
  result.flatten
end
################################

apf = load_apf
# File.open('check_apf.txt', 'w'){_1.puts apf.pretty_inspect}
ol_length = apf_length(apf) * 2
ol = Array.new(9).map{' ' * ol_length}
apf.each do |k, ap|
  next if ap[:x].zero?
  next if ap[:range].zero?
  tx = ap[:x] * 2 - 2
  range = ap[:range] * 2
  key = ap[:key]
  comment = ap[:comment].dup
  ar = sept_chars_size(comment, range)
  ar.each_with_index do |e, i|
    ol[i + 1][tx, e.size] = e
  end
  # qkey
  if range < key.size
    ol[6][tx, 1] = key[0]
    ol[7][tx, 2] = key[1, 2]
  else
    ol[8][tx, 3] = key[0, 3]
  end
end

header1 = '*****                  1                   2                   3                   4                   5                   6                   7                   8                   9                   10*'
header2 = '*****1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 *'

out_buf = []
(ol_length / 200).times do |i|
  out_buf << header1
  out_buf << header2
  ol.each_with_index do |e, ei|
    out_buf << "#{(i + 1).to_s.rjust(2, '0')}#{ei.to_s.rjust(2, '0')}*#{e[i * 200, 200]}*"
  end
end
out_buf << header1
out_buf << header2

File.open('result.olc', 'w'){|f| f.puts out_buf}
################################





