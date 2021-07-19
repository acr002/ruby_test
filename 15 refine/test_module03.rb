

# https://techplay.jp/column/536
# ƒNƒ‰ƒX“à‚Åmodule‚ğg‚¤ê‡


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

  def xxx(x, y)
    [multi(x, y), divide(x, y)]
  end
end

a = Test.new
p a.xxx(10, 5)
p a.multi(10, 5)
p a.divide(10, 5)

