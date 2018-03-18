require 'models/bakery'
require 'models/product'
require 'models/pack'

describe 'Bakery' do
  describe '#new' do
    it 'should create bakery' do
      pack = Pack.new(1, 1)

      product = Product.new('Vegemite Scroll', 'VS5', [pack])

      bakery = Bakery.new([product])

      expect(bakery.products).to eq [product]
    end

    it 'should throw argument exception when products nil' do
      expect { Bakery.new(nil) }.to raise_error(ArgumentError)
    end
  end
end
