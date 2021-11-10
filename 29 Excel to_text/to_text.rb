
# Excel���̃f�[�^���e�L�X�g�ɕϊ����܂��B
# ���L�̂R�t�@�C���𓯈�f�B���N�g���ɓ���āAto_text.rb�����s���Ă��������B
# result.in�t�@�C���𓯈�f�B���N�g���ɏo�͂��܂��B
# positions��apf���Ȃ��̂�key(Qcode)�ł��B���ꂳ���Ă��������B

# ��������t�@�C��
# - positions.xlsx(�t�@�C�����͌Œ�)
# - apf�t�@�C��
# - pickup data.xlsx(�t�@�C�����͌Œ�)

# pickup data.xlsx�͂��łɏW�߂��t�@�C���ł��B
# in�t�H���_�ȂǂɌʂ̃t�@�C�������āA�����𒼐ڏ����ł���悤�ɂł����炢���Ǝv���܂��B
# ���s�ł̂����Ƃ����FA�𔲂��o���K�v���Ȃ��Ƃ������Ƃł��B

require 'win32ole'
require 'pp'

class String
  def midre(ar, apf)
    ans = ar.map{_1.to_s.rjust(apf[:size], '0')}.join
    a = ans[0, apf[:range]]
    self[apf[:x] - 1, apf[:range]] = a.ljust(apf[:range])
  end

  def midre_l(ar, apf)
    a = ar[0].to_s
    self[apf[:x] - 1, apf[:range]] = a.rjust(apf[:range])
  end
end
################################

def excel_load(path, ws_index = 1)
  app = WIN32OLE.new('Excel.Application')
  wb = app.workbooks.open(path)
  a = wb.worksheets(ws_index).usedrange.value
  wb.close(false)
  app.quit
  a
end
################################

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

def to_text(text_size, apf, h)
  ol = ' ' * text_size
  h.each do |k, v|
    unless apf.include?(k)
      puts 'error'
      pp k
      pp v
    end
    ap = apf[k]
    case ap[:type]
    when :R
      ol.midre_l(v, ap)
    when :M
      ol.midre(v, ap)
    when :S
      ol.midre(v, ap)
    end
  end
  ol
end
################################

# hash��key�͈ʒu���(y��x)�ɂ��܂����B�d�����Ȃ����߂ł��Bcode�ōs����MA�ŏd�����������܂��B
def load_position(path = "#{Dir.pwd}/positions.xlsx")
  a = excel_load(path)
  pos = {}
  a.each_with_index do |y, idx|
    next if idx == 0
    h = {}
    key = y[2].to_sym
    h[:key] = key
    h[:pos] = y[1].to_i
    h[:value] = y[3].to_i unless y[3].nil?
    h[:type] = y[4].upcase.to_sym
    pos[h[:pos]] = h
  end
  pos
end
################################

# load
pos_list = load_position
apf = load_apf
text_size = apf_length(apf)
data = excel_load("#{Dir.pwd}/pickup data.xlsx")
col = []
#-------------------------------

# main
data.each_with_index do |ar, idx|
  next if idx <= 2
  h = {}
  pos_list.each do |px, pos|
    x = pos[:pos]
    next if ar[x].nil?
    if pos[:type] == :M
      if ar[x].to_s.downcase == 'true'
        v = pos[:value]
      end
    else
      v = ar[x].to_i
    end
    key = pos[:key]
    h[key] ||= []
    h[key] << v
  end
  col << to_text(text_size, apf, h)
end
File.open('result.in', 'w'){_1.puts col}
#-------------------------------


