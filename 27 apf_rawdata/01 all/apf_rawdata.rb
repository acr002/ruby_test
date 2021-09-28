
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

def load_apf(fn)
  apf = {}
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
  apf
end
################################

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

def calc_value(apf, sno, len, fixer, rec_count)
  col = []

  # �ŏ��l�̏o��
  buf = ' ' * len
  apf.each do |k, v|
    if v[:cts].zero?
      cts = 1
    else
      cts = v[:cts]
    end
    ar = (1..cts).to_a
    buf.sf!(v, ar)
  end
  buf.sf!(sno, [10001])
  col << buf

  # �ő�l�̏o��
  buf = ' ' * len
  apf.each do |k, v|
    if v[:cts].zero?
      ar = [('9' * v[:size]).to_i]
    else
      ar = [v[:cts]]
    end
    buf.sf!(v, ar)
  end
  buf.sf!(sno, [10002])
  col << buf

  # rand()
  # �񓚂��邩�ǂ�����rand�Ō��߂܂��B
  # fixer�̒l��傫������΂���قǉ񓚐��͑����Ȃ邱�Ƃ����҂ł��܂��B
  (rec_count - 2).times do |i|
    buf = ' ' * len
    apf.each do |k, v|
      next if rand(0..fixer).zero?
      # �񓚒l�̍쐬
      case v[:type]
      when 'R'
        # �����̌����𒲐����A2�`3�����炢�ɂ��܂��B
        fix_column = v[:size]
        fix_column = 3 if fix_column > 3
        # column = rand(1..v[:size])
        column = rand(1..fix_column)
        a = ('9' * column).to_i
        ar = [rand(1..a)]
      when 'S'
        ar = [rand(1..v[:cts])]
      when 'M'
        a = []
        rand(1..v[:cts]).times do
          a << rand(1..v[:cts])
        end
        ar = a.uniq.sort
      end
      buf.sf!(v, ar)
    end
    buf.sf!(sno, [i + 10003])
    col << buf
  end
  col
end

def rawdata(fn)
  # ��b�f�[�^�̎擾
  apf = load_apf(fn)
  sno = set_sno
  len = apf_length(apf)
  fixer = 4
  rec_count = 1000

  # �o�͗p�̒l���쐬
  calc_value(apf, sno, len, fixer, rec_count)
end

# output to file
def puts_file(col, fn)
  File.open(fn, 'w') do |f|
    f.puts col
  end
end

def main_apf_rawdata
  Dir.glob('*.apf') do |fn|
    fn_put = "test data #{File.basename(fn, '.*')}.in"
    col = rawdata(fn)
    puts_file(col, fn_put)
  end
end

main_apf_rawdata


