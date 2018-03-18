require 'models/bakery'
require 'models/pack'
require 'models/product'
require 'services/product_finder'

describe 'ProductFinder' do
  describe '#find' do
    it 'should throw exception when product with code not found' do
      product = Product.new('Vegemite Scroll', 'VS5', [])
      bakery = Bakery.new([product])

      expect{ ProductFinder.find(bakery, 'NOT_FOUND') }.to raise_error(ProductFinder::ProductNotFound)
    end

    it 'should return product by code' do
      product = Product.new('Vegemite Scroll', 'VS5', [])
      bakery = Bakery.new([product])

      expect(ProductFinder.find(bakery, 'VS5')).to eq product
    end
  end
end
