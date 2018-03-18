require 'models/bakery'
require 'models/pack'
require 'models/product'
require 'services/package_service'

describe 'PackageService' do
  describe '#call' do
    it 'should return "No option" when there are no rooms' do
      expect(PackageService.call(Product.new("name", "code", []), 1)).to eq(nil)
    end

    # it "my test" do
    #   room1 = Room.new("Single", 1, 30)
    #   room2 = Room.new("Double", 2, 50)
    #   room3 = Room.new("Family", 4, 85)
    #   finder = ReservationFinder.new({
    #                                      room1.type => {:room => room1, :quantity => 2},
    #                                      room3.type => {:room => room3, :quantity => 1},
    #                                      room2.type => {:room => room2, :quantity => 3}})
    #
    #   expect(finder.solve(2)).to eq(Reservation.new([room2]))
    # end
  end
end
