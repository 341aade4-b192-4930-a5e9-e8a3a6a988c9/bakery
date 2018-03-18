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
      expect { Pack.new('invalid', 2) }.to raise_error(ArgumentError)
      expect { Pack.new(1, 'invalid') }.to raise_error(ArgumentError)
    end

    it 'should be eql as a hash keys when pack has same data' do
      pack_1 = Pack.new(1, 2)
      pack_2 = Pack.new(1, 2)

      hash = {}
      hash[pack_1] = 'test'

      expect(hash[pack_2]).to eq 'test'
    end
  end
end
