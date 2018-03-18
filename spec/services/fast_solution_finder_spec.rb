require 'models/bakery'
require 'models/pack'
require 'models/product'
require 'services/fast_solution_finder'

describe 'FastSolutionFinder' do
  describe '#solve' do
    it 'should return "No option" when there are packs' do
      pack = Pack.new(2, 30)
      product = Product.new('Vegemite Scroll', 'VS5', [pack])

      expect(FastSolutionFinder.solve(product, 1)).to eq(nil)
    end

    it 'should return "No option" when requested buns is not odd, but all packs include odd number of buns' do
      pack = Pack.new(2, 30)
      product = Product.new('Vegemite Scroll', 'VS5', [pack])

      expect(FastSolutionFinder.solve(product, 13)).to eq(nil)
    end

    it 'should return the one pack that has the right number of buns' do
      pack = Pack.new(13, 30)
      product = Product.new('Vegemite Scroll', 'VS5', [pack])

      expect(FastSolutionFinder.solve(product, 13)).to eq(pack => 1)
    end

    it 'should process a lot of packs types correctly' do
      pack1 = Pack.new(1, 30)
      pack2 = Pack.new(2, 30)
      pack3 = Pack.new(3, 30)

      product = Product.new('Vegemite Scroll', 'VS5', [pack1, pack2, pack3])

      expect(FastSolutionFinder.solve(product, 6)).to eq(pack3 => 2)
      expect(FastSolutionFinder.solve(product, 14)).to eq(pack2 => 1, pack3 => 4)
      expect(FastSolutionFinder.solve(product, 15)).to eq(pack3 => 5)

      expect(FastSolutionFinder.solve(product, 15)).to eq(pack3 => 5)
    end

    it 'should process complex tasks correctly' do
      pack1 = Pack.new(7, 30)
      pack2 = Pack.new(11, 30)
      pack3 = Pack.new(19, 30)

      product = Product.new('Vegemite Scroll', 'VS5', [pack1, pack2, pack3])

      expect(FastSolutionFinder.solve(product, 14)).to eq(pack1 => 2)
      expect(FastSolutionFinder.solve(product, 120)).to eq(pack1 => 2, pack2 => 1, pack3 => 5)
      expect(FastSolutionFinder.solve(product, 150)).to eq(pack1 => 2, pack2 => 2, pack3 => 6)

      expect(FastSolutionFinder.solve(product, 15)).to eq(nil)
    end

    it 'should process complex tasks correctly' do
      pack1 = Pack.new(21, 30)
      pack2 = Pack.new(112, 30)
      pack3 = Pack.new(36, 30)

      pack4 = Pack.new(7, 30)
      pack5 = Pack.new(12, 30)
      pack6 = Pack.new(15, 30)

      product = Product.new('Vegemite Scroll', 'VS5', [pack1, pack2, pack3, pack4, pack5, pack6])

      expect(FastSolutionFinder.solve(product, 1500)).to eq(pack4 => 2, pack6 => 2, pack2 => 13)
    end

    it 'should process fast with large numbers' do
      # with recursive service it works for 21.36 seconds, but now it works for less than 0.1 seconds

      pack1 = Pack.new(1, 30)
      pack2 = Pack.new(2, 30)
      pack3 = Pack.new(3, 30)

      product = Product.new('Vegemite Scroll', 'VS5', [pack1, pack2, pack3])

      expect(FastSolutionFinder.solve(product, 1500)).to eq(pack3 => 500)
    end
  end
end
