class PackageService
  class << self

    def call(product, number_of_items)
      find_solution(product.list_of_packs, number_of_items)
    end

    private

    def find_solution(list_of_packs, number_of_items)
      queue = Queue.new
      queue << { value: 0, from: nil }

      best_solutions = {}

      while !queue.empty? do
        item = queue.pop

        list_of_packs.index do |pack|
          queue << { value: item.value + pack.count, from: item.value }
        end

        best_solutions[item.value] = item.from

        break if item.value >= number_of_items
      end

      
    end
  end
end