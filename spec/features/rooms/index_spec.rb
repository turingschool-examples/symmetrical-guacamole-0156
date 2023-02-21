require 'rails_helper'

RSpec.describe 'rooms index page', type: :feature do
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
		visit "/rooms"
	end

	describe 'list all rooms' do
		it 'should have room suite, nightly rate and name of hotel' do
			within "div##{hotel_1.id}" do
				expect(page).to have_content(hotel_1.name)
				expect(page).to have_content("Suite: #{room_5.suite} - Rate: #{room_5.rate}, Guests Stayed: #{room_5.guest_count}")
				expect(page).to have_content("Suite: #{room_3.suite} - Rate: #{room_3.rate}, Guests Stayed: #{room_3.guest_count}")
				expect(page).to_not have_content(hotel_2.name)
				expect(page).to_not have_content("Suite: #{room_2.suite} - Rate: #{room_2.rate}, Guests Stayed: #{room_2.guest_count}")
			end

			within "div##{hotel_2.id}" do
				expect(page).to have_content(hotel_2.name)
				expect(page).to have_content("Suite: #{room_2.suite} - Rate: #{room_2.rate}, Guests Stayed: #{room_2.guest_count}")
				expect(page).to have_content("Suite: #{room_4.suite} - Rate: #{room_4.rate}, Guests Stayed: #{room_4.guest_count}")
			end

			within "div##{hotel_3.id}" do
				expect(page).to have_content(hotel_3.name)
				expect(page).to have_content("Suite: #{room_1.suite} - Rate: #{room_1.rate}, Guests Stayed: #{room_1.guest_count}")
			end
		end
	end
end