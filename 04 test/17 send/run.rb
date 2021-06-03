
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



__END__
Object#public_send, BasicObject#__send__, Object#method, Kernel.#eval, Proc, Method

