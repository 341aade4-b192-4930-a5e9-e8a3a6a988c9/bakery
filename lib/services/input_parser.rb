class InputParser
  InvalidInput = Class.new(StandardError)

  class << self
    def parse(input)
      tokens = input.split
      return Integer(tokens[0]), tokens[1]
    rescue StandardError
      raise InvalidInput, "Invalid input: #{input}"
    end
  end
end
