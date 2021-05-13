
# https://teratail.com/questions/187572

require 'open-uri'
require 'nokogiri'
require 'cgi'

USER_AGENT  = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/'
                + '537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36'
url_base = 'https://www.google.com/search?q='
referer = 'https://www.google.com/'

search_word = CGI.escape('Â‹ó•¶ŒÉ')

3.times do |i|
  search_url = (url_base + search_word)

  unless i.zero?
    search_url += "&ei=123&start=#{i * 10}"
  end

  doc = Nokogiri::HTML.parse(open(search_url, {'User-Agent' => USER_AGENT, 'Referer' => referer}))

  doc.xpath('//h3[@class="r"]').each do |h3|
    puts "ƒ^ƒCƒgƒ‹F" + h3.text
    url = CGI.unescape(CGI.unescapeHTML(h3.xpath('a/@href').text))
    puts "‚t‚q‚kF" + url.split('&sa=U&ved=').first.sub('/url?q=', '')
  end

  sleep(rand(5..10))

  referer = search_url
end



