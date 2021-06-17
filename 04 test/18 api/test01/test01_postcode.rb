
# https://techacademy.jp/magazine/21788
# http://zipcloud.ibsnet.co.jp/doc/api

require 'net/http'
require 'json'
require 'pp'
require 'csv'


def cc_get_api(url_base, csv_path)
  url = URI.parse(url_base)
  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true
  csv = CSV.read(csv_path, encoding: 'cp932:utf-8', headers: true)
  ar = []
  cn = 0
  csv.each do |row|
    unless row[1].nil?
      cn += 1
      a = row[1].rjust(7, '0')
      path = "#{url_base}?zipcode=#{a}"
      req = Net::HTTP::Get.new(path)
      res = https.request(req)
      h = JSON.parse(res.body)
      # pp h
      p a
      # print "#{cn} / #{csv.size}\r"
      unless h['status'] == 200
        p "#{a} not find"
        next
      else
        pref = h['results'].first['address1']
        ar << [a, row[2], pref].join(',')
      end
      # unless pref == row[2]
      #   p "not same #{pref} - #{row[2]}"
      # end
    end
  end
  ar
end

url_base = 'https://zipcloud.ibsnet.co.jp/api/search'
csv_path = 'postcode.csv'
ar = cc_get_api(url_base, csv_path)

File.open('result_ar.csv', 'w', encoding: 'utf-8:cp932') do |f|
  f.puts ar
end



