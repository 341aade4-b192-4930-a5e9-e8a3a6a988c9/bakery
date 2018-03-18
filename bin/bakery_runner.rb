require 'optparse'

require_relative '../lib/models/bakery'
require_relative '../lib/models/pack'
require_relative '../lib/models/product'
require_relative '../lib/services/fast_solution_finder'

def setup_bakery
  product_vs5 =
    Product.new(
      'Vegemite Scroll',
      'VS5',
      [
        Pack.new(3, 6.99), Pack.new(2, 9.95)
      ]
    )

  product_mb11 =
    Product.new(
      'Blueberry Muffin',
      'MB11',
      [
        Pack.new(2, 9.95), Pack.new(5, 16.95), Pack.new(8, 24.95)
      ]
    )

  product_cf =
    Product.new(
      'Croissant CF',
      'CF',
      [
        Pack.new(3, 5.95), Pack.new(5, 9.95), Pack.new(9, 16.99)
      ]
    )

  Bakery.new([product_vs5, product_mb11, product_cf])
end

bakery = setup_bakery

ARGF.each do |line|
  begin
    number_of_items, code = InputParser.parse(line)

    product = BakeryService.find_product(bakery, code)

    solution = FastSolutionFinder.solve(product, number_of_items)

    p SolutionFormatter.format(solution)
  rescue StandardError
    p 'No option'
  end
end
