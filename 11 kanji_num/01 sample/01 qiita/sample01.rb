# coding: cp932

# https://qiita.com/alfa/items/24611f664949709f530d

def convert_kansuji(text)
  text.tr('零〇一二三四五六七八九０-９', '001234567890-9')
  # text.tr('〇一二三四五六七八九', '0123456789')
    .gsub(/(\d+)?十(\d+)?/) { ($1 || 1).to_i * 10            + $2.to_i }
    .gsub(/(\d+)?百(\d+)?/) { ($1 || 1).to_i * 100           + $2.to_i }
    .gsub(/(\d+)?千(\d+)?/) { ($1 || 1).to_i * 1000          + $2.to_i }
    .gsub(/(\d+)万(\d+)?/)  {        $1.to_i * 10000         + $2.to_i }
    .gsub(/(\d+)億(\d+)?/)  {        $1.to_i * 100000000     + $2.to_i }
    .gsub(/(\d+)兆(\d+)?/)  {        $1.to_i * 1000000000000 + $2.to_i }
end

# a = "平成三十年七月三日　宣言　御給料月額三兆五百億八千五十五万百三十円以上　欲イ"
# # p convert_kansuji(a).encode('cp932:utf-8')
# p convert_kansuji(a).encode('utf-8')

# a = File.read('sample.txt', encoding: 'cp932:utf-8').split(/\R/)
a = File.read('sample.txt', encoding: 'cp932').split(/\R/)
a.each do |e|
  next if e.strip.size.zero?
  p "#{e} #{convert_kansuji(e)}".encode('utf-8')
end

