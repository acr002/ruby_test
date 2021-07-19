
# https://qiita.com/scivola/items/dc49d56c90fd0cb6d4d3

module ExtString
  refine String do
    def xxx
      " #{self}"
      # self.size
    end
  end

  refine Array do
    def xxx
      self.size
    end
  end
end

using ExtString

p 'test data'.xxx
p [1, 2, 3].xxx





