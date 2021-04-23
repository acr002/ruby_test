


module Car
  class SuperCar
    def self.introduce
      puts 'this is supercar'
    end
  end
end

class SuperCar
  def self.introduce
    puts 'sssss'
  end
end

Car::SuperCar.introduce
SuperCar.introduce
################################

# Mix-in: classにmoduleの機能を混ぜ合わせること。
# class内でincludeで呼び出します。
# 下記の例のように複数をカンマ区切りで指定できます。
module Dog
  def saydog
    puts 'bow'
  end
end

module Cat
  def saycat
    puts 'nyao'
  end
end

class Animal
  include Dog, Cat
end

a = Animal.new
a.saydog
a.saycat
################################

# classに機能を追加するだけでなく、
# moduleを関数のように使うこともできます。
# モジュール名.メソッド(引数) の形で呼び出します。
# ただ、module内でmodule_functionとして定義してあげる必要があるようです。
# このmodule_functionですが、これがある状態でclassにincludeするとエラーになります。
module Calc
  def multi(x, y)
    x * y
  end

  def divide(x, y)
    if y.zero?
      0
    else
      x / y
    end
  end

  # module_function :multi, :divide
end

# p Calc.multi(10, 5)
# p Calc.divide(10, 5)

class MM
  include Calc
end
a = MM.new
p a.multi(10, 5)
p a.divide(10, 5)
################################






