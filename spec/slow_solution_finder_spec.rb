require 'models/bakery'
require 'models/pack'
require 'models/product'
require 'services/slow_solution_finder'

describe 'SlowPackageService' do
  describe '#call' do
    skip 'just case, where service with recursion work for a long time' do
      # 21.36 seconds

      pack1 = Pack.new(1, 30)
      pack2 = Pack.new(2, 30)
      pack3 = Pack.new(3, 30)

      product = Product.new('Vegemite Scroll', 'VS5', [pack1, pack2, pack3])

      expect(SlowSolutionFinder.solve(product, 1500)).to eq(pack3 => 500)
    end
  end
end
