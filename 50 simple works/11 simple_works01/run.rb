
class String
  # o—Í‚·‚é’l‚Ì’²®
  # range over‚ª”­¶‚µ‚½ê‡‚Ì‚½‚ß‚Ìˆ—
  def pretty_buf(range)
    t_range = self.size - range
    t_range = 0 if t_range.negative?
    self[t_range..-1]
  end
end
a = '1234'
p a.pretty_buf(2)
################################




