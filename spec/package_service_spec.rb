require 'models/bakery'
require 'models/pack'
require 'models/product'
require 'services/package_service'

describe 'PackageService' do
  describe '#call' do
    it 'should return "No option" when there are no rooms' do
      expect(PackageService.call(Product.new("name", "code", []), 1)).to eq(nil)
    end

    it "my test" do
      pack = Pack.new(1, 30)

      product = Product.new("name", "code", [pack])

      expect(PackageService.call(product, 1)).to eq({ 1 => 1 })
    end

    it "my test" do
      pack1 = Pack.new(1, 30)
      pack2 = Pack.new(2, 30)

      product = Product.new("name", "code", [pack1, pack2])

      expect(PackageService.call(product, 2)).to eq({ 2 => 1 })
    end

    it "my test" do
      pack1 = Pack.new(1, 30)
      pack2 = Pack.new(2, 30)
      pack3 = Pack.new(3, 30)

      product = Product.new("name", "code", [pack1, pack2, pack3])

      expect(PackageService.call(product, 6)).to eq({ 3 => 2 })
      expect(PackageService.call(product, 14)).to eq({ 3 => 4, 2 => 1 })
      expect(PackageService.call(product, 15)).to eq({ 3 => 5 })

      puts PackageService.call(product, 15000)
    end
  end
end
