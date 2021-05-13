
require 'open-uri'

temp = OpenURI.open_uri('http://rooter.jp')
p temp.read
p temp.charset
image = OpenURI.open_uri('http://rooter.jp/wp-content/uploads/2018/03/rooter_logo.png')
open('rooter_logo.png', 'w+b') do |out|
  out.write(image.read)
end

# スマホ版htmlの取得
# ua = 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1'
# open(url,  'User-Agent' => ua)

# 汎用性を持たせたもの
# UA_CHROME = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36'.freeze
# def get_html(url, ua = UA_CHROME)
#   open(url, 'User-Agent' => ua, allow_redirections: :all).read
# end





