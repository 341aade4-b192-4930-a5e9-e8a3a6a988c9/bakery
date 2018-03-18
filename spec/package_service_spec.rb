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

      expect(PackageService.call(product, 1)).to eq({ 1 => 1})
    end
  end
end
