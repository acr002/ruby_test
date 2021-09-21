
require 'slim'

p Slim::Template.new("test01.slim").render(self)

__END__
Dir.glob('*slim') do |fn|
  # p fn
  p Slim::Template.new(fn).render(self)
end
