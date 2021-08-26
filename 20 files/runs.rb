
def check_file(a, b)
  a_ext = a.map do |e|
    File.extname(e)
  end
  result = []
  a_ext.each do |e|
    result << b.include?(e)
  end
  result.all?(true)
end

need_file = ['.apf', '.in', '.txt', '.md']
a = search_fns
p check_file(a, need_file)
################################


# need_file = ['apf', 'in', 'txt']
# path_ar = Dir.pwd.split('/')
# p path_ar
# job_code = path_ar[1]
# p job_code
################################

# ”z—ñ‚Å‚Í‚È‚­Hash‚ÅŠÇ—‚µ‚½•û‚ª’š”J‚©‚ÈH
def check_files(dir_glob, need_file)
  h = {}
  need_file.uniq.each{|e| h[e] = 0}
  dir_glob.each do |e|
    ext = File.extname(e)
    if h.has_key?(ext)
      h[ext] += 1
    end
  end
  h
end
################################

def to_hash(ar)
  ar.map{[_1, nil]}.to_h
  # h = {}
  # ar.map{|e| h[e] = nil}
  # h
end

a = %w(a b c d)
p a
b = to_hash(a)
p b
################################





