require 'models/bakery'
require 'models/pack'
require 'models/product'
require 'services/total_price_calculator'

describe 'OutputFormatter' do
  describe '#format' do
    it 'should return formatted string' do
      output = TotalPriceCalculator.calculate(Pack.new(5, 10) => 1, Pack.new(5, 2) => 2)

      expect(output).to eq 20
    end
  end
end
