
# line���󂯎��̂ŁA���H����line��Ԃ��Ă��������B
def works_on_code(line, apf)
  # begin on parameter -------------

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

  # line.value�Œl���擾���܂��B�߂�l��Array�ł��B�l�����̃I�u�W�F�N�g�ł��B
  target = line.value(apf[:key])
  # target�ɑ΂���empty?�Ȃǂŕ]�����܂��B
  # b���V�����ݖ�ł��Btarget�Ɠ��l�ɒl������Array���]�܂����`�ł��B
  # to_buf�ŕ����񉻂��܂��B
  b_buf = b.to_buf(apf[:new_key])
  # line.midre�ŏo�͂��܂��B
  line.midre(b_buf, apf[:new_key])


  b = []
  b << 1 unless line.value(apf[:R01]).empty?
  b << 2 unless line.value(apf[:R02]).empty?
  tapf = apf[:FL4]
  line.midre(b.to_buf(tapf), tapf)

  # a = line.value(apf[:M01])
  # if a.include?(12)
  #   b = a.dup
  #   b.delete(12)
  #   # log << [line.value(apf[:SNO]), a.to_buf(apf[:M01])]
  #   log << [line.value(apf[:SNO]), a, b]
  # end

  # end of parameter ---------------
  line
end
#-----------------------------------

