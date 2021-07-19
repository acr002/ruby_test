
# https://zenn.dev/ksss/articles/721c95581bff1fbc1bb1

module EE
  refine Numeric do
    def div_zero(a)
      if a.zero?
        0
      else
        self / a
      end
    end
  end
end

using EE

p 10.3.div_zero(0)




