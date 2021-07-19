
module Ext
  refine Numeric do
    def div_zero(a)
      if a.zero?
        0
      else
        self / a
      end
    end
  end

  refine Array do
    def sum_count
      [self.sum, self.size]
    end
  end
end

