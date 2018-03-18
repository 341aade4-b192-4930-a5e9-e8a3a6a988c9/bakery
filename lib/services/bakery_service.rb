class BakeryService
  class << self
    def find_product(backery, code)
      bakery.products.find { |product| product.code == code }
      # TODO: exception and proceed it
    end
  end
end