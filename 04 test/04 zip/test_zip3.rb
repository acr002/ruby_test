
class Array
  def index_hash
    a = (1..self.size).to_a
    a.map! do |e|
      ('key' + e.to_s).to_sym
    end
    # a = (1..self.size).to_a.map(&:to_s).map(&:to_sym)
    a.zip(self).to_h
  end
end

a = %w(a b c d e a b c d e f g h)
b = a.index_hash
p a, b


