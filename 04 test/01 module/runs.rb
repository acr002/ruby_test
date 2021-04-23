


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

# Mix-in: class��module�̋@�\���������킹�邱�ƁB
# class����include�ŌĂяo���܂��B
# ���L�̗�̂悤�ɕ������J���}��؂�Ŏw��ł��܂��B
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

# class�ɋ@�\��ǉ����邾���łȂ��A
# module���֐��̂悤�Ɏg�����Ƃ��ł��܂��B
# ���W���[����.���\�b�h(����) �̌`�ŌĂяo���܂��B
# �����Amodule����module_function�Ƃ��Ē�`���Ă�����K�v������悤�ł��B
# ����module_function�ł����A���ꂪ�����Ԃ�class��include����ƃG���[�ɂȂ�܂��B
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






