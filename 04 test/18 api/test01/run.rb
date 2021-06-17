
require 'net/http'
require 'json'
require 'pp'
require 'csv'


def cc_get_api(url_base, csv_path)
  url = URI.parse(url_base)
  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true
  csv = CSV.read(csv_path, encoding: 'cp932:utf-8', headers: true)
  csv.each do |row|
    unless row[1].nil?
      path = "#{url_base}?zipcode=#{row[1]}"
      req = Net::HTTP::Get.new(path)
      res = https.request(req)
      h = JSON.parse(res.body)
      pp h
    end
  end
end

url_base = 'https://zipcloud.ibsnet.co.jp/api/search'
csv_path = 'postcode.csv'
cc_get_api(url_base, csv_path)




