#-----------------------------------------------------------[date: 2021.06.10]

class Array
  def include_any?(b)
    b.any? do |e|
      self.include?(e)
    end
  end

  def include_all?(b)
    b.all? do |e|
      self.include?(b)
    end
  end

  def other?(a)
    !((self - a).empty?)
  end

  def same?(a)
    (self - a).empty?
  end

  def zero?
    self.same?([0])
  end

  def has_nil?
    self.same?([nil])
  end

  # 有効な回答(0以外の数値、文字長さ0ではない文字列)かどうかを確認します。
  # String, Integer, Floatのみを対象にしています。nilは有効ではないと判断しました。
  def valid_any?
    self.any? do |e|
      case e
      when String
        !(e.strip.size.zero?)
      when Integer, Float
        !(e.zero?)
      end
    end
  end

  def valid_all?
    self.all? do |e|
      case e
      when String
        !(e.strip.size.zero?)
      when Integer, Float
        !(e.zero?)
      end
    end
  end

  def count?(a)
    self.size == a.first
  end

  def all9?(arg)
    self.first == ('9' * arg).to_i
    # self.join.match?(/9+/)
  end

  # selfを破壊的にargの内容でdeleteします。
  # なのでselfを返すことはしません。
  def delete_ar(arg)
    arg.each do |e|
      self.delete(e)
    end
  end

  # table情報が必要なのでfcを引数でとります。
  def table(arg, table)
    ar = []
    p "table: #{table}"
    self.map do |e|
      if table.include?(arg.first)
        table[arg.first].each do |tb|
          if tb[:range].include?(e)
            ar << tb[:ct]
            break
          end
        end
      end
    end
    ar
  end

  def median
    a = self.sort
    if a.size.even?
      # 中央の二つを足してに2で割る方式
      [a[(a.size / 2) - 1, 2].sum / 2.0]
    else
      [a[a.size / 2]]
    end
  end
end
# nil?は組込みを使います。レシーバがnilかどうか。
# 配列内がnilのみかどうかはhas_nil?を使います。
# empty?は組込みを使います。

# a = [nil, nil].uniq
# a = nil
# p a.empty?
# p a.has_nil?
# p a.nil?
# p a.valid_any?
# p a.valid_all?
# b = [2]
# p a.count?(b)
# a = [99999, 1]
# p a.all9?(5)
# a = [1, 3, 5, 10]
# b = [2, 3, 5]
# p a, b
# p a.delete_ar(b)
# p a, b






