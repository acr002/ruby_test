
# parameter�t�@�C����ǂݍ���ŁAfc hash��Ԃ��܂��B

# load(parameter)
def load_parameter
  fc = []
  para_fns = Dir.glob('para*.txt')
  para_fns.each do |fn|
    File.foreach(fn) do |line|
      next if line.empty?

    end
  end
end

