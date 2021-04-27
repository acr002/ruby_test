
class SFdata
  # apfs
  # line
  # values
  def self.set_line(line)
    @@line = line
  end

  def self.load_apf(path)
    @@apf = Hash.new
  end

  def parse(*a)
    a.each do |e|
      apf = @apfs[e.to_sym]
      apf.limit.times do |i|

      end
    end
  end
end

a = WorksOL.new(%w(1 2 5 7).map(&:to_i))
p a.class
p a.include?(2)
b = a.select{|e| e % 2}
p b
p b.class

__END__
apf, lineを共有。
ただ、インスタンスは１つしか作らない予定なので、クラス変数でもインスタンス変数でもどちらでもいいと思います。

もしくは、line.parse(apf)のデータをSFdataとするのであれば、lineやapfはクラス変数の方がいいですね。
データにする意味は、メソッドが使えるから？
どんなメソッドを想定しているのか。
データの保持はArrayにしてもいい。

クラス変数であれば、def self.method(a)で外部からSFdata.method(a)として呼び出せる。





