
def search_fns(dir = Dir.pwd)
  Dir.glob(dir + '/*')
end

# ”z—ñ‚Å‚Í‚È‚­Hash‚ÅŠÇ—‚µ‚½•û‚ª’š”J‚©‚ÈH
def check_files(dir_glob, need_file)
  h = {}
  need_file.each do |e|
    h[e] = 0
  end
  dir_glob.each do |e|
    ext = File.extname(e)
    if h.has_key?(ext)
      h[ext] += 1
    end
  end
  h
end

need_file = ['.apf', '.in', '.txt', '.md', '.rb']
a = search_fns
p check_files(a, need_file)









