

require 'H:\A\ruby\_github\03 works/rw_works.rb'

def load_text(path = "#{Dir.pwd}/*.in")
  fns = Dir.glob(path)
  a = []
  fns.each do |fn|
    File.foreach(fn) do |line|
      a << Gline.new(line.chomp)
    end
  end
  a
end
