
require 'nokogiri'
require 'open-uri'

# ‘ÎÛ‚ÌURL
url = "https://www.sejuku.net/blog/"

# Nokogiri‚ÅURL‚Ìî•ñ‚ğæ“¾‚·‚é
# contents = Nokogiri::HTML(open(url),nil,"utf-8")
contents = Nokogiri::HTML(open(url))

puts contents

__END__
require 'nokogiri'
require 'open-uri'

url = "https://www.sejuku.net/blog/"
contents = Nokogiri::HTML(open(url), nil, "utf-8")
puts contents

