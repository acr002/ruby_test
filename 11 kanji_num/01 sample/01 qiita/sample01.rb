# coding: cp932

# https://qiita.com/alfa/items/24611f664949709f530d

def convert_kansuji(text)
  text.tr('��Z���O�l�ܘZ������O-�X', '001234567890-9')
  # text.tr('�Z���O�l�ܘZ������', '0123456789')
    .gsub(/(\d+)?�\(\d+)?/) { ($1 || 1).to_i * 10            + $2.to_i }
    .gsub(/(\d+)?�S(\d+)?/) { ($1 || 1).to_i * 100           + $2.to_i }
    .gsub(/(\d+)?��(\d+)?/) { ($1 || 1).to_i * 1000          + $2.to_i }
    .gsub(/(\d+)��(\d+)?/)  {        $1.to_i * 10000         + $2.to_i }
    .gsub(/(\d+)��(\d+)?/)  {        $1.to_i * 100000000     + $2.to_i }
    .gsub(/(\d+)��(\d+)?/)  {        $1.to_i * 1000000000000 + $2.to_i }
end

# a = "�����O�\�N�����O���@�錾�@�䋋�����z�O���ܕS������܏\�ܖ��S�O�\�~�ȏ�@�~�C"
# # p convert_kansuji(a).encode('cp932:utf-8')
# p convert_kansuji(a).encode('utf-8')

# a = File.read('sample.txt', encoding: 'cp932:utf-8').split(/\R/)
a = File.read('sample.txt', encoding: 'cp932').split(/\R/)
a.each do |e|
  next if e.strip.size.zero?
  p "#{e} #{convert_kansuji(e)}".encode('utf-8')
end

