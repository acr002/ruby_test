
class SFdata
  # apfs
  # line
  # values
  def self.set_line(line)
    @@line = line
  end

  def self.load_apf(path)
    @@apf = Hash.new
  end

  def parse(*a)
    a.each do |e|
      apf = @apfs[e.to_sym]
      apf.limit.times do |i|

      end
    end
  end
end

a = WorksOL.new(%w(1 2 5 7).map(&:to_i))
p a.class
p a.include?(2)
b = a.select{|e| e % 2}
p b
p b.class

__END__
apf, line�����L�B
�����A�C���X�^���X�͂P�������Ȃ��\��Ȃ̂ŁA�N���X�ϐ��ł��C���X�^���X�ϐ��ł��ǂ���ł������Ǝv���܂��B

�������́Aline.parse(apf)�̃f�[�^��SFdata�Ƃ���̂ł���΁Aline��apf�̓N���X�ϐ��̕��������ł��ˁB
�f�[�^�ɂ���Ӗ��́A���\�b�h���g���邩��H
�ǂ�ȃ��\�b�h��z�肵�Ă���̂��B
�f�[�^�̕ێ���Array�ɂ��Ă������B

�N���X�ϐ��ł���΁Adef self.method(a)�ŊO������SFdata.method(a)�Ƃ��ČĂяo����B





