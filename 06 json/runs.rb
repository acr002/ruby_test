
require 'json'

File.open('config.json') do |file|
  h = JSON.load(file)
  p h
end

=begin
{
  "Key": "S01",
  "type": "S",
  "x": 11,
  "size": 1,
  "cts": 5,
},
{
  "key": "S02",
  "type": "M",
  "x": 12,
  "size": 2,
  "cts": 12,
},
=end
################################

# to_json
def set_el(key, type, x, size, cts, comment)
  h = Hash.new
  h[:key]     = key
  h[:type]    = type
  h[:x]       = x
  h[:size]    = size
  h[:cts]     = cts
  h[:comment] = comment
  h
end

apf = Hash.new
apf[:S01] = set_el('S01', 'S', 11, 1, 5, 'Q01')
apf[:S02] = set_el('S02', 'M', 12, 2, 12, 'Q02')
apf[:S03] = set_el('S03', 'S', 27, 1, 3, 'Q03')
# a = JSON.parse(apf)
# p h
# a = JSON.generate(h)
# puts a
a = JSON.pretty_generate(apf)
File.open('test_output.json', 'w') do |f|
  f.puts a
end
################################

# from_json
def load_json(path)
  h = Hash.new
  File.open(path) do |f|
    h = JSON.load(f)
    # puts h
    # puts JSON.generate(h)
    # puts JSON.pretty_generate(h)
  end
  h
  # JSON.generate(h)
  # JSON.pretty_generate(h)
end

h = load_json('test_output.json')
puts h
################################

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




