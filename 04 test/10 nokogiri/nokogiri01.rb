
require 'nokogiri'
require 'open-uri'

# �Ώۂ�URL
url = "https://www.sejuku.net/blog/"

# Nokogiri��URL�̏����擾����
# contents = Nokogiri::HTML(open(url),nil,"utf-8")
contents = Nokogiri::HTML(open(url))

puts contents

__END__
require 'nokogiri'
require 'open-uri'

url = "https://www.sejuku.net/blog/"
contents = Nokogiri::HTML(open(url), nil, "utf-8")
puts contents

