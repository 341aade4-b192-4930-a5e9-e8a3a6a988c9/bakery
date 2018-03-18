class FastSolutionFinder
  class << self

    def solve(product, number_of_items)
      find_solution(product.list_of_packs, number_of_items)
    end

    private

    def find_solution(list_of_packs, number_of_items)
      best_solutions = { 0 => {} }

      number_of_items.times do |value|
        solution = best_solutions[value]

        next unless solution

        list_of_packs.each do |pack|
          clone_solution = solution.clone

          clone_solution[pack] = (clone_solution[pack] || 0) + 1

          best_solutions[value + pack.count] ||= clone_solution
        end

        best_solutions.delete value
      end

      best_solutions[number_of_items]
    end
  end
end
