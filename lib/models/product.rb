class Product
  attr_accessor :name, :code, :list_of_packs

  def initialize(name, code, list_of_packs)
    raise ArgumentError, 'name cannot be nil or empty' if name.nil? || name.empty?
    raise ArgumentError, 'code cannot be nil or empty' if code.nil? || code.empty?
    raise ArgumentError, 'list_of_packs cannot be nil or empty' if list_of_packs.nil? || list_of_packs.empty?

    @name = name
    @code = code
    @list_of_packs = list_of_packs
  end
end
