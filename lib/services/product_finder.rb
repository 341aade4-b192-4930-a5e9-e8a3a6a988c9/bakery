class ProductFinder
  ProductNotFound = Class.new(StandardError)

  class << self
    def find(bakery, code)
      product = bakery.products.find { |product| product.code == code }

      raise ProductNotFound, "Product with code #{code} does not exist." unless product

      product
    end
  end
end
