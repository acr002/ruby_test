
class String
  # 出力する値の調整
  # range overが発生した場合のための処理
  def pretty_buf(range)
    t_range = self.size - range
    t_range = 0 if t_range.negative?
    self[t_range..-1]
  end
end
a = '1234'
p a.pretty_buf(2)
################################




