require 'rails_helper'

RSpec.describe 'Room Index' do 
  describe 'As a visitor' do 
    it 'has a list of all rooms' do 
      hotel = Hotel.create!(name: "Marriott", location: "Denver")
      guest = Guest.create!(name: "Brian", nights: 2)
      room_1 = Room.create!(rate: 100, suite: "President suite", hotel_id: hotel.id)
      room_2 = Room.create!(rate: 150, suite: "Honeymoon Suite", hotel_id: hotel.id)
      RoomGuest.create!(room: room_1, guest: guest )
      RoomGuest.create!(room: room_2, guest: guest )

      visit '/rooms'

      expect(page).to have_content(room_1.suite)
      expect(page).to have_content("Rate: #{room_1.rate}")
      expect(page).to have_content(room_2.suite)
      expect(page).to have_content("Rate: #{room_2.rate}")
      expect(page).to have_content("hotel: #{room_1.hotel.name}")
    end

    it 'can list the number of guests that have stayed in a room' do 
      hotel = Hotel.create!(name: "Marriott", location: "Denver")
      guest_1 = Guest.create!(name: "Brian", nights: 2)
      guest_2 = Guest.create!(name: "Brian", nights: 2)
      room_1 = Room.create!(rate: 100, suite: "President suite", hotel_id: hotel.id)
      room_2 = Room.create!(rate: 150, suite: "Honeymoon Suite", hotel_id: hotel.id)
      RoomGuest.create!(room: room_1, guest: guest_1)
      RoomGuest.create!(room: room_2, guest: guest_2 )
      RoomGuest.create!(room: room_2, guest: guest_1)

      visit '/rooms'
     
      expect(page).to have_content("Number of total guests: #{room_1.guests.count}")
      expect(page).to have_content("Number of total guests: #{room_2.guests.count}")
    end
  end
end