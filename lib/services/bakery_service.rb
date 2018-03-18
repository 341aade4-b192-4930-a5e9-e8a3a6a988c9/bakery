class BakeryService
  ProductNotFound = Class.new(StandardError)

  class << self
    def find_product(bakery, code)
      product = bakery.products.find { |product| product.code == code }

      raise ProductNotFound, "Product with code #{code} does not exist." unless product

      product
    end
  end
end
