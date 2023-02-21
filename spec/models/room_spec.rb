require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it {should belong_to :hotel}
		it {should have_many :guests}
    it {should have_many :room_guests}
  end

	# describe 'class methods' do
	# 	@guest1 = Guest.create!(name: 'Brad Dunlap', nights: 5)
	# 	@guest2 = Guest.create!(name: 'Adrian Fierro', nights: 4)
	# 	@guest3 = Guest.create!(name: 'Aaron McKendry', nights: 3)
	# 	@hotel = Hotel.create!(name: 'Sleepy Inn', location: "Pittsburgh")
	# 	@hotel2 = Hotel.create!(name: 'Hells Hotel', location: "Detroit")
	# 	@pres = @hotel.rooms.create!(rate: 200, suite: "Presidential")
	# 	@pent = @hotel.rooms.create!(rate: 250, suite: "Penthouse")
	# 	@suite = @hotel2.rooms.create!(rate: 100, suite: "Suite")
	# 	@honey = @hotel2.rooms.create!(rate: 150, suite: "Honeymoon Suite")
	# 	RoomGuest.create!(guest: @guest1, room: @pres)
	# 	RoomGuest.create!(guest: @guest1, room: @pent)
	# 	RoomGuest.create!(guest: @guest2, room: @pent)
	# 	RoomGuest.create!(guest: @guest2, room: @suite)
	# 	RoomGuest.create!(guest: @guest3, room: @pent)

	
	# end
end