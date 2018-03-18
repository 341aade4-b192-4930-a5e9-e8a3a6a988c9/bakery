class Bakery < Struct.new(:products)
  attr_accessor :products

  def initialize(products)
    raise ArgumentError, "products cannot be nil or empty" if products == nil || products.empty?

    @products = products
  end
end
