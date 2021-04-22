
def load_text(path = "#{Dir.pwb}/*.in")
  fns = Dir.glob(path)
  a = []
  fns.each do |fn|
    File.foreach(fn) do |line|
      a << line
    end
  end
  a
end
