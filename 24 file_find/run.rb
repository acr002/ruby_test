
# Dir#globでは大量のデータを扱うのに向かないので
# Dir#foreachを再帰的に使う
# Dir.foreach('.') do |f|
#   p f
# end

require 'pp'

def search_file(path)
  ar = []
  Dir.foreach(path) do |fn|
    next if fn == '.' || fn == '..'
    new_path = File.expand_path(fn, path)
    # new_path = File.join(fn, path)
    p new_path
    if File.directory?(new_path)
      ar.concat search_file(new_path)
    else
      if new_path =~ /.*txt/
        ar << fn
      end
      # ar << fn
    end
  end
  ar
end
pp search_file('./')


      # if new_path.end_with?(/txt/)
      # if new_path.include?('txt')
      # if new_path == 'routes.rb'
