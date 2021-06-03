
class Foo
  def foo() 'foo' end

  def bar()
    p 'called bar'
    'bar'
  end

  def baz() 'baz' end
end

methods = {a: :foo, b: :bar, c: :baz}
methods.each do |k, v|
  p Foo.new.send(v)
end
################################

Object#public_send, BasicObject#__send__, Object#method, Kernel.#eval, Proc, Method
################################

# sendはレシーバのメソッドが呼び出されるようです。
ar = %w(sum min max)
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

ar.each do |e|
  p a.send(e)
end
################################

a = 5.2
b = 2
c = a.+(b).-(3)
p c
################################

a = 10
%w(+ - / *).each do |e|
  base = a
  a = a.send(e, 2)
  p "#{a} = #{base} #{e} #{2}"
end
#=> "12 = 10 + 2"
#=> "10 = 12 - 2"
#=> "5 = 10 / 2"
#=> "10 = 5 * 2"
################################







