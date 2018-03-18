class TotalPriceCalculator
  class << self
    def calculate(solution)
      solution.inject(0) { |sum, (pack, count)| sum + pack.price * count }.round(2)
    end
  end
end
