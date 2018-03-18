require 'models/bakery'
require 'models/pack'
require 'models/product'
require 'services/total_price_calculator'

describe 'TotalPriceCalculator' do
  describe '#calculate' do
    it 'should return sum of prices for solution' do
      output = TotalPriceCalculator.calculate(Pack.new(5, 10) => 1, Pack.new(5, 2) => 2)

      expect(output).to eq 14
    end
  end
end
