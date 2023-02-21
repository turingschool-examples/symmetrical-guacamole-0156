require 'rails_helper'

RSpec.describe 'guest show page', type: :feature do
	describe 'display information' do
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
			GuestRoom.create!(guest: guest_1, room: room_1)
			GuestRoom.create!(guest: guest_1, room: room_5)
			GuestRoom.create!(guest: guest_1, room: room_3)
			GuestRoom.create!(guest: guest_2, room: room_1)
			GuestRoom.create!(guest: guest_2, room: room_2)
		end

		it 'shows the guests name' do
			visit "/guests/#{guest_1.id}"

			expect(page).to have_content(guest_1.name)
			expect(page).to_not have_content(guest_2.name)

			within '#rooms' do
				expect(page).to have_content(room_1.name)
				expect(page).to have_content(room_1.rate)
				expect(page).to have_content(room_1.hotel.name)
				expect(page).to have_content(room_5.name)
				expect(page).to have_content(room_3.name)
			end
		end
	end
end