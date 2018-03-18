class PackageService
  class << self

    def call(product, number_of_items)
      find_solution(product.list_of_packs, number_of_items)
    end

    private

    def find_solution(list_of_packs, number_of_items)
      queue = []
      queue << {value: 0, solution: {}}

      while !queue.empty? do
        item = queue.shift

        value = item[:value]
        solution = item[:solution]

        return solution if value >= number_of_items

        list_of_packs.each do |pack|
          clone_solution = solution.clone
          clone_solution[pack.count] = (clone_solution[pack.count] || 0) + 1

          queue << {value: value + pack.count, solution: clone_solution}
        end
      end
    end
  end
end