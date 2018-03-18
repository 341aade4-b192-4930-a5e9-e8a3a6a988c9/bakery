require 'models/bakery'
require 'models/pack'
require 'models/product'
require 'services/product_finder'

describe 'ProductFinder' do
  describe '#find' do
    it 'should throw exception when product with code not found' do
      pack = Pack.new(1, 1)
      product = Product.new('Vegemite Scroll', 'VS5', [pack])
      bakery = Bakery.new([product])

      expect { ProductFinder.find(bakery, 'NOT_FOUND') }.to raise_error(ProductFinder::ProductNotFound)
    end

    it 'should return product by code' do
      pack = Pack.new(1, 1)
      product = Product.new('Vegemite Scroll', 'VS5', [pack])
      bakery = Bakery.new([product])

      expect(ProductFinder.find(bakery, 'VS5')).to eq product
    end
  end
end
