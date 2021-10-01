
require 'nkf'

# cm[:header] as Array
# cm[:body][:key][:ct][Xct] As String
#                [:type] As String
#                [:select] As Array[key, ct]
#                [:type_arg] As Integer
#                [:limit] As Integer
#                [:range] As Integer
#                [:cts] As Integer

def srjust(a, n = 1)
  a.to_s.rjust(n)
end

def space(n)
  ' ' * n
end

# 個数と最大値を確認
def check_minmax(h, log)
  h.each do |k, v|
    min, max = v[:ct].keys.minmax
    unless min.zero?
      log << ['error min', k, min, v[min]]
    end
    unless v[:ct].size - 1 == max
      log << ['error max', k, max, v.size]
    end
  end
end

def load_cm
  cm_line = Array.new
  cm_header = Array.new
  flag_in_header = true
  Dir.glob('*.cm').each do |fn|
    # File.foreach(fn, encoding: 'windows-31j:UTF-8') do |line|
    # File.foreach(fn, encoding: 'cp932:UTF-8') do |line|
    File.foreach(fn, encoding: 'cp932') do |line|
      a = line.strip
      next if a.empty?
      if a.start_with?('*', '#')
        if flag_in_header
          cm_header << a
        else
          next
        end
      end
      if a.upcase.start_with?('CM', 'TM')
        flag_in_header = false if flag_in_header
        cm_line << a
      end
    end
  end

  h = Hash.new
  log = Array.new
  cm_line.each do |a|
    next unless a.upcase.start_with?('CM', 'TM')
    key = a[2, 3].upcase
    ct = a[5, 2].to_i
    text = NKF.nkf('-w -Z1', a.byteslice(8, 54)).strip
    s_key = key.to_sym
    h[s_key] = Hash.new unless h.include?(s_key)
    h[s_key][:ct] = Hash.new unless h[s_key].include?(:ct)
    if ct.zero?
      if a.upcase.start_with?('C')
        h[s_key][:ct][0] = text + h[s_key][:ct][0].to_s
        # type -------------------------------------------------------------
        t_type = a.byteslice(68, 1)
        if t_type.nil?
          h[s_key][:type] = 'S'
        else
          if t_type.strip.empty?
            h[s_key][:type] = 'S'
          else
            h[s_key][:type] = t_type.upcase
          end
        end
        # type arg ---------------------------------------------------------
        h[s_key][:type_arg] = a.byteslice(69, 2).to_i
        # select -------------------------------------------------------------
        3.times do |i|
          sel_key = a.byteslice(72 + (i * 7), 3)
          unless sel_key.nil?
            h[s_key][:select] = Hash.new unless h[s_key].include?(:select)
            h[s_key][:select][i + 1] = [sel_key, a.byteslice(76 + (i * 7), 2).to_i]
          end
        end
      else
        h[s_key][:ct][0] = h[s_key][:ct][0] + text
      end
    else
      if h[s_key][:ct].include?(ct)
        log << [s_key, 'same ct(update)', ct]
      end
      h[s_key][:ct][ct] = text
    end
  end
  check_minmax(h, log)

  # check and set
  h.each do |k, v|
    cts = v[:ct].keys.sort[-1]
    if cts >= 10
      size = 2
    else
      size = 1
    end
    h[k][:cts] = cts
    h[k][:size] = size
    case v[:type]
    when 'R'
      h[k][:range] = v[:type_arg]
      h[k][:limit] = 1
    when 'M'
      h[k][:range] = size * cts
      h[k][:limit] = cts
    when 'L'
      h[k][:range] = size * v[:type_arg]
      h[k][:limit] = v[:type_arg]
    when 'S'
      h[k][:range] = size
      h[k][:limit] = 1
    end
  end

  unless log.empty?
    File.open('log.csv', 'w') do |f|
      log.each do |e|
        f.puts e.join(',')
      end
    end
    puts "error logs: #{log.count}"
  end
  h
  cm_hash = Hash.new
  cm_hash[:header] = cm_header
  cm_hash[:body] = h
  cm_hash
end
#/////////////////////////////////////////////////////////////////////////////

cm = load_cm
# File.open('result_load_cm.txt', 'w') do |f|
#   cm[:body].each do |k, v|
#     f.puts k
#     f.puts v[:type]
#     f.puts v[:range]
#     f.puts v[:limit]
#     f.puts v[:cts]
#     f.puts '-' * 24
#   end
# end
# __END__

apf = Array.new
apf << '*OLSNO   15     *SampleNo.        R                     01 1'
apf << '*OLCOD  113     *code             R                     01 1'
x = 21
cm[:body].each do |k, v|
  a = Array.new
  a << 'COL'
  a << srjust(k, 3)
  a << srjust(x, 4)
  if v[:type] == 'R'
    a << srjust(v[:range], 1) + space(5)
  else
    a << srjust(v[:size], 1)
    a << srjust(v[:cts], 2)
    if v[:type] == 'S'
      a << space(3)
    else
      a << '1' + srjust(v[:limit], 2)
    end
  end
  #--------------------------------
  a << '*' + space(17) + v[:type]
  if v[:type] == 'R'
    a << '                     01 1'
  end
  apf << a.join
  x += v[:range]
end

# 加工用(categorize) ---------------------------------------------------------
b = ((x - 1).div(100) + 1) * 100
xw = 1
cm[:body].each do |k, v|
  next unless v[:type] == 'R'
  a = Array.new
  a << 'COL'
  a << srjust(k, 3)
  a << srjust(xw + b, 4)
  a << 2
  a << srjust(v[:ct].size - 1, 2)
  a << "#{space(3)}*ct_#{space(14)}S"
  if xw == 1
    apf << ''
    apf << '* categorize'
  end
  apf << a.join
  xw += 2
end
x = xw + b unless xw == 1

# 加工用(flag) ---------------------------------------------------------------
b = ((x - 1).div(100) + 1) * 100
xw = 1
cm[:body].each do |k, v|
  if v.include?(:select)
    v[:select].each do |k, ar|
      unless cm[:body].include?(ar[0].to_sym)
        a = Array.new
        a << 'COL'
        a << srjust(ar[0], 3)
        a << srjust(xw + b, 4)
        a << 2
        a << srjust(1, 2)
        a << "#{space(3)}*f_#{space(15)}S"
        if xw == 1
          apf << ''
          apf << '* flag'
        end
        apf << a.join
        xw += 2
      end
    end
  end
end
x = xw + b unless xw == 1

# output(apf) ----------------------------------------------------------------
a = ((x - 1).div(100) + 1) * 100
b = 4000.div(a) * a
c = "// PARAM I/B=#{a.to_s.rjust(4, '0')},#{b.to_s.rjust(5, '0')}"
File.open('result.apf', 'w') do |f|
  f.puts cm[:header]
  f.puts c
  f.puts apf
end

# output(cross) --------------------------------------------------------------
crs = Array.new
cn = 0
cm[:body].each do |k, v|
  cn += 1
  a = Array.new
  a << 'CRS'
  a << cn.to_s.rjust(4, '0')
  a << 'xxx'
  a << k.to_s
  if v.include?(:select)
    a << space(9)
    v[:select].each.with_index do |(sel_k, sel_v), i|
      a << '*' unless i.zero?
      a << sel_v[0]
      a << '='
      a << srjust(sel_v[1], 5)
    end
    a << space((3 - v[:select].size) * 10)
  else
    a << space(38)
  end
  if v[:type] == 'R'
    a << k.to_s
    a << space(16) + 'YY' + space(4)
  else
    a << space(25)
  end
  a << 'T *'
  crs << a.join
end
File.open('result.crs', 'w')do |f|
  f.puts cm[:header]
  f.puts crs
end

# output(olp) ----------------------------------------------------------------
olp = Array.new
olp << 'CODE='
olp << 'HDR1='
olp << 'HDR2=<<input>>'
olp << 'D01*sample no.                                            S   *5*  *  * *   *         *         *'
olp << 'DMY                                                       15'
cm[:body].each do |k, v|
  b = Array.new
  b << 'C01 ' + k.to_s + space(1)
  # a = v[:ct][0][0, 20]
  # b << a + space(54 - a.size)
  b << space(50)
  if v[:type] == 'R'
    b << v[:type] + space(3) + '*' + v[:range].to_s + '*' + srjust(v[:cts], 2)
  else
    b << v[:type] + space(3) + '*' + v[:size].to_s + '*' + srjust(v[:cts], 2)
  end
  b << '*  * *   *         *         *'
  olp << b.join
end
olp << ''
cm[:body].each do |k, v|
  next unless v[:type] == 'R'
  b = Array.new
  b << 'C01 ' + k.to_s + space(51) + 'S   *2*' + srjust(v[:cts], 2)
  b << '*  * *   *         *         *'
  olp << b.join
end
File.open('result.olp', 'w', encoding:'windows-31j'){|f| f.puts olp}





