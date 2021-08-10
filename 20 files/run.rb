
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

__END__
need_file = ['apf', 'in', 'txt']
path_ar = Dir.pwd.split('/')
p path_ar
job_code = path_ar[1]
p job_code





















