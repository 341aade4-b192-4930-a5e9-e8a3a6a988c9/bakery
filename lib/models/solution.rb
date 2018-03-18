class Solution

  def initialize(hash = {})
    @hash = hash
  end

  def add(pack)
    @hash[pack.count] ||= { pack: pack, count: 0 }
    @hash[pack.count][:count] += 1
  end

  def clone
    Solution.new(
      Marshal.load(
        Marshal.dump(@hash)
      )
    )
  end
end
