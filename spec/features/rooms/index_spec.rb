require 'rails_helper'

RSpec.describe 'When a user visit a rooms index page', type: :feature do
	before do 
		@guest1 = Guest.create!(name: 'Brad Dunlap', nights: 5)
		@guest2 = Guest.create!(name: 'Adrian Fierro', nights: 4)
		@guest3 = Guest.create!(name: 'Aaron McKendry', nights: 3)
		@hotel = Hotel.create!(name: 'Sleepy Inn', location: "Pittsburgh")
		@hotel2 = Hotel.create!(name: 'Hells Hotel', location: "Detroit")
		@pres = @hotel.rooms.create!(rate: 200, suite: "Presidential")
		@pent = @hotel.rooms.create!(rate: 250, suite: "Penthouse")
		@suite = @hotel2.rooms.create!(rate: 100, suite: "Suite")
		@honey = @hotel2.rooms.create!(rate: 150, suite: "Honeymoon Suite")
		RoomGuest.create!(guest: @guest1, room: @pres)
		RoomGuest.create!(guest: @guest1, room: @pent)
		RoomGuest.create!(guest: @guest2, room: @pent)
		RoomGuest.create!(guest: @guest2, room: @suite)
		RoomGuest.create!(guest: @guest3, room: @pent)
		visit '/rooms'
	end
	
  scenario 'see a list of all rooms' do
		within 'div#list_of_rooms' do
			expect(page).to have_content("Presidential")
			expect(page).to have_content("Penthouse")
			expect(page).to have_content("Suite")
			expect(page).to have_content("Honeymoon Suite")
		end
	end

	scenario 'including the rooms nightly rate and name of hotel' do
		within "div#room-#{@pres.id}" do
			expect(page).to have_content("Suite: Presidential")
			expect(page).to have_content("Nightly Rate: $200")
			expect(page).to have_content("Hotel: Sleepy Inn")
		end

		within "div#room-#{@pent.id}" do
			expect(page).to have_content("Suite: Penthouse")
			expect(page).to have_content("Nightly Rate: $250")
			expect(page).to have_content("Hotel: Sleepy Inn")
		end
	end

	scenario 'and the number of guests that have stayed in that room' do
		within "div#room-#{@pres.id}" do
			expect(page).to have_content("Total Guests: 1")
		end			
		
		within "div#room-#{@pent.id}" do
		save_and_open_page
		
			expect(page).to have_content("Total Guests: 3")
		end	
	end
end