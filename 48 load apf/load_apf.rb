
require 'pp'

# �ȒP��apf��ǂݍ��ނ��Ƃ�ڕW�Ƃ��Ă��܂��B
# ���L�̃��\�b�h��apf�f�[�^��ێ�����Hash���擾���܂��B
# ������apf�t�@�C�����������ꍇ�A���ׂēǂݍ��݂܂��B
# key���d�����Ă���ꍇ�͏㏑�����Ă����̂ŁA�����ɂ���s��D�悵�܂��B

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

# �g����
apf = load_apf

# �o��
File.open('result_load_apf.txt', 'w'){_1.puts apf.pretty_inspect}

p apf.size

# �\��
# pp apf



