
require 'json'

# from_json2
def load_json(path)
  h = Hash.new
  File.open(path, encoding: 'cp932:utf-8') do |f|
    h = JSON.load(f)
  end
  h
end

h = load_json('config.json')
File.open('result.txt', 'w', encoding: 'cp932') do |f|
  h.each do |k, v|
    f.puts "#{k}: #{v}"
  end
end
################################





