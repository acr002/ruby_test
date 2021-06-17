
# https://techacademy.jp/magazine/21788

require 'net/http'
require 'json'
require 'pp'

url = URI.parse("https://randomuser.me/api/")
https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true
req = Net::HTTP::Get.new(url.path)
res = https.request(req)
h = JSON.parse(res.body)
pp h




