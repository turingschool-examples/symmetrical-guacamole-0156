require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'relationships' do
    it {should have_many :rooms}
    it {should have_many :guests}
  end

	describe '#unique_guests', type: :model do
		it 'shows a unique list of guests' do
			@guest1 = Guest.create!(name: 'Brad Dunlap', nights: 5)
			@guest2 = Guest.create!(name: 'Adrian Fierro', nights: 4)
			@guest3 = Guest.create!(name: 'Aaron McKendry', nights: 3)
			@hotel = Hotel.create!(name: 'Sleepy Inn', location: "Pittsburgh")
			@pres = @hotel.rooms.create!(rate: 200, suite: "Presidential")
			
			RoomGuest.create!(guest: @guest1, room: @pres)
			RoomGuest.create!(guest: @guest1, room: @pres)
			RoomGuest.create!(guest: @guest1, room: @pres)
			RoomGuest.create!(guest: @guest2, room: @pres)
			RoomGuest.create!(guest: @guest3, room: @pres)

			expect(@hotel.unique_guests).to eq([@guest1, @guest2, @guest3])
		end
	end
end