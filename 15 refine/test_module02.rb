

# https://techplay.jp/column/536
# include‚ğg‚¤ê‡


module Calc
  def multi(x, y)
    x * y
  end

  def divide(x, y)
    x / y
  end
end

class Test
  include Calc
end

a = Test.new
p a.multi(10, 5)
p a.divide(10, 5)

