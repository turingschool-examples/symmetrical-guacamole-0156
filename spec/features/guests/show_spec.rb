require 'rails_helper'

RSpec.describe 'guest show page', type: :feature do
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
		RoomGuest.create!(guest: guest_1, room: room_3)
		RoomGuest.create!(guest: guest_2, room: room_1)
		RoomGuest.create!(guest: guest_2, room: room_2)
		visit "/guests/#{guest_1.id}"
	end

	describe 'display information' do
		it 'shows the guests name' do
			expect(page).to have_content(guest_1.name)
			expect(page).to_not have_content(guest_2.name)

			within '#rooms' do
				expect(page).to have_content("#{room_1.suite}: #{room_1.rate} - #{room_1.hotel.name}")
				expect(page).to have_content("#{room_5.suite}: #{room_5.rate} - #{room_5.hotel.name}")
				expect(page).to have_content("#{room_3.suite}: #{room_3.rate} - #{room_3.hotel.name}")
				expect(page).to_not have_content(room_2.suite)
				expect(page).to_not have_content(room_2.rate)
			end
		end
	end
	
	describe 'add room to guest' do
		it 'shows a form to add a room to the guest' do
			expect(page).to have_field(:room_id)
			expect(page).to_not have_content(room_2.suite)
			save_and_open_page
			within '#room_form' do
				select room_2.id, from: :room_id
				click_button "Add Room"
			end

			expect(page).to have_content("#{room_2.suite}: #{room_2.rate} - #{room_2.hotel.name}")
		end
	end
end