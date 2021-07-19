

# https://techplay.jp/column/536
# module_functionを使う場合


module Calc
  def multi(x, y)
    x * y
  end

  def divide(x, y)
    x / y
  end

  module_function :multi
  module_function :divide
end


p Calc.multi(10, 5)
p Calc.divide(10, 5)

