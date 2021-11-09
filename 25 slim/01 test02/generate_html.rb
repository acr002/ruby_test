
require 'slim'
require 'cgi'

# path = 'test02.html.slim'
# a = Slim::Template.new(path).render(self)
# p a.class
# p a

def slim_to_html
  Dir.glob('*.slim') do |fn|
    buf = Slim::Template.new(fn).render(self)
    File.open("#{File.basename(fn, '.*')}.html", 'w'){_1.puts CGI.pretty(buf)}
  end
end

slim_to_html

