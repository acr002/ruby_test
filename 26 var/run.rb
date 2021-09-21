
class Hoge
  def name(a = '')
    @a = a
  end

  def new
    @a = 'test'
  end

  def put
    @a
  end
end

a = Hoge.new
a.name()
p a.put


