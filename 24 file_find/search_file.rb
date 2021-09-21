
def search_file(path)
  a = []
  Dir.foreach(path) do |fn|
    next if fn == '.' || fn == '..'
    new_path = File.expand_path(fn, path)
    if File.directory?(new_path)
      a.concat search_file(new_path)
    else
      # if new_path =~ /.*routes.rb/
      if new_path.end_with?('routes.rb')
        a << "# #{new_path}"
        File.foreach(new_path) do |line|
          a << line
        end
        a << "##{'=' * 77}"
      end
    end
  end
  a
end

# h = "##{'=' * 77}"
a = search_file('./')
unless a.empty?
  File.open('result_search_file.rb', 'w'){_1.puts a}
end


