require 'models/bakery'
require 'models/product'
require 'models/pack'

describe 'Pack' do
  describe '#new' do
    it 'should create pack' do
      pack = Pack.new(1, 2)

      expect(pack.count).to eq 1
      expect(pack.price).to eq 2
    end

    it 'should throw argument exception when invalid args' do
      expect{ Pack.new("invalid", 2) }.to raise_error(ArgumentError)
      expect{ Pack.new(1, "invalid") }.to raise_error(ArgumentError)
    end
  end
end
