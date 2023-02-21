require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it {should belong_to :hotel}
		it { should have_many :room_guests}
		it { should have_many(:guests).through(:room_guests) }
  end

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
	end

	describe '#guest_count' do
		it 'returns the number of guests that have stayed in that room' do
			expect(room_1.guest_count).to eq(2)

			RoomGuest.create!(guest: guest_3, room: room_1)

			expect(room_1.guest_count).to eq(3)
		end
	end
end