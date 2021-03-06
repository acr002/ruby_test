
# mainはsimple_works.rbです。
# このファイルはsimple_works.rbから呼ばれるパラメータファイルの位置付けです。

# lineを受け取るので、加工してlineを返してください。
def works_on_code(line, apf)
  # begin on parameter -------------

  # include?について
  # 引数は一つだけ指定できます。これはrubyの仕様です。
  # 複数指定する場合は、作成したinclude_all?やinclude_any?を使用してください。
  # それぞれ引数はArrayで渡してください。
  # include_all?(ar)  arの内容が全てselfが持っている時にtrueになります。一つでも含まれないとfalseが返ります。
  # include_any?(ar)  arのうち、一つでも含まれていたらtrueが返ります。一つも含まれない場合のみfalseが返ります。

  # 逆セット
  # 加工結果は変数に保持してください。line.fix_arを行ったあと、再度変数を参照した場合に相違が生じる可能性があるからです。
  ap_s01 = apf[:S01]
  ap_s02 = apf[:S02]
  s01 = line.value(ap_s01)
  s02 = line.value(ap_s02)
  unless s02.empty?
    if s01.empty?
      s01 = [1]
      line.fix_ar(ap_s01, s01)
    end
    unless s01.include_any?([1, 2])
      s02 = []
      line.fix_ar(ap_s02, s02)
    end
  end

  # tapf = apf[:R01]
  # a = line.value(tapf).map{_1 * 2}
  # tapf = apf[:RA1]
  # line.midre_l(a.to_buf(tapf, ' '), tapf)

  # b = []
  # b << 1 unless line.value(apf[:S01]).empty?
  # b << 2 unless line.value(apf[:S02]).empty?
  # b << 3 unless line.value(apf[:S03]).empty?
  # b << 4 unless line.value(apf[:S04]).empty?
  # b << 5 unless line.value(apf[:S05]).empty?
  # b << 6 unless line.value(apf[:S06]).empty?
  # tapf = apf[:FL1]
  # line.midre(b.to_buf(tapf), tapf)

  # b = []
  # b << 1 unless line.value_in(apf[:R01]).strip.empty?
  # b << 2 unless line.value_in(apf[:R02]).strip.empty?
  # tapf = apf[:FL2]
  # line.midre(b.to_buf(tapf), tapf)

  # b = []
  # b << 1 unless line.value_in(apf[:R01]).to_i.zero?
  # b << 2 unless line.value_in(apf[:R02]).to_i.zero?
  # tapf = apf[:FL3]
  # line.midre(b.to_buf(tapf), tapf)

  # line.valueで値を取得します。戻り値はArrayです。値だけのオブジェクトです。
  # target = line.value(apf[:key])
  # targetに対してempty?などで評価します。
  # bが新しい設問です。targetと同様に値だけのArrayが望ましい形です。
  # to_bufで文字列化します。
  # b_buf = b.to_buf(apf[:new_key])
  # line.midreで出力します。
  # line.midre(b_buf, apf[:new_key])


  # 複数のRAを一つのMAにするフラグ立て
  # b = []
  # b << 1 unless line.value(apf[:R01]).empty?
  # b << 2 unless line.value(apf[:R02]).empty?
  # line.fix_ar(apf[:FL4], b)

  # a = line.value(apf[:M01])
  # if a.include?(12)
  #   b = a.dup
  #   b.delete(12)
  #   # log << [line.value(apf[:SNO]), a.to_buf(apf[:M01])]
  #   log << [line.value(apf[:SNO]), a, b]
  # end

  # end of parameter ---------------
  # 必ず下記のlineを返すようにしてください。
  line
end
#-----------------------------------

