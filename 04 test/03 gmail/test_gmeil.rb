
# https://csharpmagazine.hatenablog.com/entry/2019/12/13/%E3%80%90Ruby%E3%80%91Gmail%E3%82%A2%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%81%A7%E3%83%A1%E3%83%BC%E3%83%AB%E9%80%81%E4%BF%A1

require 'gmail'

USERNAME = 'xxxx@gmail.com'
PASSWORD = 'ffffffff'

gmail = Gmail.new(USERNAME, PASSWORD)

message = gmail.generate_message do
  to      'tamada@across-net.co.jp'
  subject 'åèñº'
  html_part do
    content_type "text/html: charset=UTF-8"
    body "<h1>ê›íËäÆóπ</h1>"
  end
end

gmail.deliver(message)
gmail.logout

