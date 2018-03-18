class PackageService

  class << self
    def call(product, number_of_items)
      find_solution(product.list_of_packs, number_of_items)
    end

    private

    def find_solution(list_of_packs, number_of_items)
      return {} if (number_of_items == 0)
      return nil if (number_of_items < 0)

      solution_with_first_pack = try_get_first_pack(list_of_packs, number_of_items)
      solution_with_next_pack = try_get_next_pack(list_of_packs, number_of_items)

      if solution_with_first_pack && solution_with_next_pack
        if count_of_items(solution_with_first_pack) < count_of_items(solution_with_next_pack)
          solution_with_first_pack
        else
          solution_with_next_pack
        end

      else
        solution_with_first_pack || solution_with_next_pack
      end
    end

    def try_get_first_pack(list_of_packs, number_of_items)
      solution =
          find_solution(list_of_packs, number_of_items - list_of_packs.first.count) if list_of_packs.any?

      if solution
        solution[list_of_packs.first.count] ||= 0
        solution[list_of_packs.first.count] += 1
        solution
      end
    end

    def try_get_next_pack(list_of_packs, number_of_items)
      list_without_first_pack = list_of_packs.drop(1)

      solution =
          find_solution(list_without_first_pack, number_of_items - list_without_first_pack.first.count) if list_without_first_pack.any?

      if solution
        solution[list_without_first_pack.first.count] ||= 0
        solution[list_without_first_pack.first.count] += 1
        solution
      end
    end

    def count_of_items(solution)
      solution.values.inject(0, :+)
    end
  end
end