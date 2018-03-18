class OutputFormatter
  class << self
    def format(number_of_items, code, solution)
      return 'No option' unless solution

      result = "#{number_of_items} #{code} $#{TotalPriceCalculator.calculate(solution)}\n"

      solution.inject(result) do |result, (pack, count)|
        result + "#{count} x #{pack.count} $#{pack.price}\n"
      end
    end
  end
end
