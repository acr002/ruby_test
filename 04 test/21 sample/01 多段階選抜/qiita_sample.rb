

# https://qiita.com/kts_h/items/0d6ffc24e3f191e4f7a5


class MultiStageSelection
  def self.solve(cmds)
    new.solve(cmds)
  end

  def initialize
    @enum = 1.step
  end

  def drop_nth(n)
    enum = @enum
    @enum = Enumerator.new do |y|
      n -= 1
      loop do
        n.times { y << enum.next }
        enum.next
      end
    end
    self
  end

  def drop_before(test)
    enum = @enum
    @enum = Enumerator.new do |y|
      a, b = enum.next, enum.next
      loop do
        y << a unless send(test, b)
        a, b = b, enum.next
      end
    end
    self
  end

  def drop_after(test)
    enum = @enum
    @enum = Enumerator.new do |y|
      a, b = enum.next, enum.next
      y << a
      loop do
        y << b unless send(test, a)
        a, b = b, enum.next
      end
    end
    self
  end

  def drop_100
    enum = @enum
    @enum = Enumerator.new do |y|
      100.times { enum.next }
      loop { y << enum.next }
    end
    self
  end

  def solve(cmds)
    cmds.each_char do |cmd|
      case cmd
      when "s" then drop_before(:square?)
      when "S" then drop_after(:square?)
      when "c" then drop_before(:cube?)
      when "C" then drop_after(:cube?)
      when "h" then drop_100
      else drop_nth(cmd.to_i)
      end
    end
    puts @enum.take(10).join(",")
  end

  private

  def square?(n)
    Math.sqrt(n).truncate**2 == n
  end

  def cube?(n)
    Math.cbrt(n).truncate**3 == n
  end
end


MultiStageSelection.solve("ss6cc24S")
MultiStageSelection.solve("4scC3hh982Cc5s")

