
require './lib_load.rb'
# String#sf(apf, ar)
# load_apf(fn)
# set_sno
# apf_length(apf)

require './lib_load_param.rb'
# load_param

def calc_value(apf, sno, len, fixer, rec_count)
  col = []

  # 最小値の出力
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

  # 最大値の出力
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
  # 回答するかどうかをrandで決めます。
  # fixerの値を大きくすればするほど回答数は多くなることが期待できます。
  (rec_count - 2).times do |i|
    buf = ' ' * len
    apf.each do |k, v|
      next if rand(0..fixer).zero?
      # 回答値の作成
      case v[:type]
      when 'R'
        # 実数の桁数を調整し、2～3桁くらいにします。
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

  # 出力用の値を作成
  calc_value(apf, sno, len, fixer, rec_count)
end

# output to file
def puts_file(col, fn)
  File.open(fn, 'w') do |f|
    f.puts col
  end
end

def main_apf_rawdata
  # 基礎データの取得
  param     = load_param
  apf       = load_apf_all
  sno       = set_sno
  len       = apf_length(apf)
  fixer     = 4
  rec_count = 1000

  col = []
  param.each do |h|
    main = apf[h[:main]]
    # sub is Array
    sub = h[:sub].map{apf[_1]}
    buf = ' ' * len
    sub.each do |e|
      (0..e[:cts]).each do |ct|
        buf.sf!(e, ct)






      end

    end
  end

  puts_file(col, fn_put)
  Dir.glob('*.apf') do |fn|
    fn_put = "test data #{File.basename(fn, '.*')}.in"
    col = rawdata(fn)
    puts_file(col, fn_put)
  end
end

main_apf_rawdata


