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

    it 'should be eq for pack with same data' do
      pack_1 = Pack.new(1, 2)
      pack_2 = Pack.new(1, 2)

      hash = {}
      hash[pack_1] += 1
      hash[pack_2] += 1

      puts hash.inspect
      # expect(pack_1).to eq pack_2
    end
  end
end
