class PackageService

  class << self
    def call(product, number_of_items)
      find_solution(product.list_of_packs, number_of_items)
    end

    private

    def find_solution(list_of_packs, number_of_items)
      return {} if (number_of_items == 0)
      return nil if (number_of_items < 0 || list_of_packs.empty?)

      first_pack = list_of_packs.first

      best_solution = nil
      count = 0

      while (count * first_pack.count <= number_of_items) do
        solution = try_get_next_pack(list_of_packs, number_of_items - count * first_pack.count)

        if solution
          solution[first_pack.count] = count if count > 0

          best_solution =
            if best_solution && (count_of_items(best_solution) <= count_of_items(solution))
              best_solution
            else
              solution
            end
        end

        count += 1
      end

      best_solution
    end

    def try_get_next_pack(list_of_packs, number_of_items)
      list_without_first_pack = list_of_packs.drop(1)

      find_solution(list_without_first_pack, number_of_items)
    end

    def count_of_items(solution)
      solution.values.inject(0, :+)
    end
  end
end