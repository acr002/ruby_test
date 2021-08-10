
require 'pp'

def search_fns(dir = Dir.pwd)
  Dir.glob(dir + '/*')
end

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

def create_hash(need_file)
  base_ext = {}
  need_file.uniq.each do |e|
    h = {}
    h[:key] = e
    h[:ext] = ".#{e}"
    h[:count] = 0
    case e
    when 'in'
      h[:base_dir] = 'data'
    else
      h[:base_dir] = 'fd'
    end
    base_ext[e] = h
  end
  base_ext
end

need_file = ['apf', 'in', 'txt', 'md', 'rb']
a = create_hash(need_file)
pp a

__END__
a = search_fns
p check_files(a, need_file)









