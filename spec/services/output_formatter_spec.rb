require 'models/bakery'
require 'models/pack'
require 'models/product'
require 'services/output_formatter'
require 'services/total_price_calculator'

describe 'OutputFormatter' do
  describe '#format' do
    it 'should return formatted string' do
      allow(TotalPriceCalculator).to receive(:calculate).and_return(10)

      output = OutputFormatter.format(5, 'VS5', Pack.new(5, 10) => 1)

      expect(output).to eq "5 VS5 $10\n1 x 5 $10\n"
    end
  end
end
