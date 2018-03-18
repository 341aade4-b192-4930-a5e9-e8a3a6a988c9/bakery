class Pack
  attr_accessor :count, :price

  def initialize(count, price)
    raise ArgumentError, 'count should be number' unless count.is_a?(Numeric)
    raise ArgumentError, 'price should be number' unless price.is_a?(Numeric)

    @count = count
    @price = price
  end

  def eql?(other)
    count == other.count && price == other.price
  end

  def hash
    [count, price].hash
  end
end
