require 'rails_helper'

RSpec.describe 'When a user visit a hotels show page', type: :feature do
	before do 
		@guest1 = Guest.create!(name: 'Brad Dunlap', nights: 5)
		@guest2 = Guest.create!(name: 'Adrian Fierro', nights: 4)
		@guest3 = Guest.create!(name: 'Aaron McKendry', nights: 3)
		@hotel = Hotel.create!(name: 'Sleepy Inn', location: "Pittsburgh")
		@hotel2 = Hotel.create!(name: 'Hells Hotel', location: "Detroit")
		@pres = @hotel.rooms.create!(rate: 200, suite: "Presidential")
		@pent = @hotel.rooms.create!(rate: 250, suite: "Penthouse")
		@suite = @hotel.rooms.create!(rate: 250, suite: "Suite")
		@lava = @hotel2.rooms.create!(rate: 666, suite: "Lava Pit")
		RoomGuest.create!(guest: @guest1, room: @pres)
		RoomGuest.create!(guest: @guest1, room: @pent)
		RoomGuest.create!(guest: @guest2, room: @pent)
		RoomGuest.create!(guest: @guest2, room: @suite)
		RoomGuest.create!(guest: @guest3, room: @suite)
		RoomGuest.create!(guest: @guest3, room: @lava)
	end
	
  scenario 'see a unique list of all guests that have stayed at this hotel.' do
		visit "/hotels/#{@hotel.id}"
		save_and_open_page
		within "div#hotel" do

    	expect(page).to have_content("Brad Dunlap")
    	expect(page).to have_content("Adrian Fierro")
    	expect(page).to have_content("Aaron McKendry")
		end

		visit "/hotels/#{@hotel2.id}"
		within "div#hotel" do
			expect(page).to have_content("Aaron McKendry")
    	expect(page).to_not have_content("Brad Dunlap") 
		end
  end
end