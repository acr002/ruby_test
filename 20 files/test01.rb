
require 'pp'

def search_fns(dir = Dir.pwd)
  Dir.glob(dir + '/*')
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

def sfns(path)
  Dir.glob(path)
end

def target_files(need_file)
  need_file.each do |k, v|
    # p "#{Dir.pwd}/*#{k}"
    p sfns("#{Dir.pwd}/*#{k}")
  end
end

ar_need_file = ['apf', 'in', 'txt', 'md', 'rb']
need_file = create_hash(ar_need_file)
pp need_file
target_files(need_file)

__END__
a = search_fns
p check_files(a, need_file)









