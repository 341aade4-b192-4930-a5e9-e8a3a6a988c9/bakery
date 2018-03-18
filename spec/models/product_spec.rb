require 'models/bakery'
require 'models/product'
require 'models/pack'

describe 'Bakery' do
  describe '#new' do
    it 'should create product' do
      pack = Pack.new(1, 1)
      product = Product.new('Vegemite Scroll', 'VS5', [pack])

      expect(product.name).to eq 'Vegemite Scroll'
      expect(product.code).to eq 'VS5'
      expect(product.list_of_packs).to eq [pack]
    end

    it 'should throw argument exception when some arg is nil' do
      expect{ Product.new(nil, 'VS5', []) }.to raise_error(ArgumentError)
      expect{ Product.new('Vegemite Scroll', nil, []) }.to raise_error(ArgumentError)
      expect{ Product.new('Vegemite Scroll', 'VS5', nil) }.to raise_error(ArgumentError)
    end
  end
end
