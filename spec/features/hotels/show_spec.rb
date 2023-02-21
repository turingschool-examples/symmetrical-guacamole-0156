require 'rails_helper'

RSpec.describe 'hotels show page', type: :feature do
	let!(:hotel_1) { Hotel.create(name: 'Marriott', location: 'Vail Resort')}
	let!(:hotel_2) { Hotel.create(name: 'Days Inn', location: 'Portland Airport')}
	let!(:hotel_3) { Hotel.create(name: 'Holiday Inn', location: 'Los Angeles')}

	let!(:room_5) { hotel_1.rooms.create(rate: 110, suite: "Double") }
	let!(:room_3) { hotel_1.rooms.create(rate: 140, suite: "Presidential") }
	let!(:room_2) { hotel_2.rooms.create(rate: 125, suite: "Twin") }
	let!(:room_4) { hotel_2.rooms.create(rate: 80, suite: "Studio") }
	let!(:room_1) { hotel_3.rooms.create(rate: 100, suite: "Deluxe") }

	let!(:guest_1) { Guest.create(name: "Charlize Theron", nights: 2) }
	let!(:guest_2) { Guest.create(name: "John Doe", nights: 1) }
	let!(:guest_3) { Guest.create(name: "Mary Jane", nights: 5) }

	before do
		RoomGuest.create!(guest: guest_1, room: room_1)
		RoomGuest.create!(guest: guest_1, room: room_5)
		RoomGuest.create!(guest: guest_1, room: room_5)
		RoomGuest.create!(guest: guest_1, room: room_3)
		RoomGuest.create!(guest: guest_2, room: room_3)
		RoomGuest.create!(guest: guest_2, room: room_1)
		RoomGuest.create!(guest: guest_3, room: room_2)
		visit "/hotels/#{hotel_1.id}"
	end

	describe 'list of guests' do
		it 'it shows a unique list of all guests that have stayed at this hotel' do
			expect(page).to have_content("List of Guests Who Have Stayed")
			
			within '#guests' do
				expect(page).to have_content(guest_1.name)
				expect(page).to have_content(guest_2.name)
				expect(page).to_not have_content(guest_3.name)
			end

			RoomGuest.create!(guest: guest_3, room: room_5)

			visit "/hotels/#{hotel_1.id}"

			within '#guests' do
				expect(page).to have_content(guest_1.name)
				expect(page).to have_content(guest_2.name)
				expect(page).to have_content(guest_3.name)
			end
		end
	end
end