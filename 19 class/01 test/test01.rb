
# https://www.fenet.jp/dotnet/column/language/6109/

class A
  attr_accessor :name, :age
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class B < A
  attr_accessor :id
  def initialize(name, age, id)
    super(name, age)
    @id = id
  end
end

a = A.new('jin', 39)
p a
p a.class

b = B.new('masu', 39, 'acr002')
p b
p b.class
p b.name
p b.age
p b.id



