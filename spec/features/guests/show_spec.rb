require 'rails_helper'

RSpec.describe 'Guest Show' do 
  describe 'as a visitor' do 
    describe 'when I visit a guest show page' do 
      it 'will have the guest name and a list of all rooms they have stayed in' do 
        hotel = Hotel.create!(name: "Marriott", location: "Denver")
        guest = Guest.create!(name: "Brian", nights: 2)
        room_1 = Room.create!(rate: 100, suite: "President suite", hotel_id: hotel.id)
        room_2 = Room.create!(rate: 150, suite: "Honeymoon Suite", hotel_id: hotel.id)
        RoomGuest.create!(room: room_1, guest: guest )
        RoomGuest.create!(room: room_2, guest: guest )

        visit "/rooms/#{guest.id}"

        expect(page).to have_content("name: #{guest.name}")
        
        within('.rooms') {
          expect(page).to have_content(room_1.suite)
          expect(page).to have_content(room_1.rate)
          # expect(page).to have_content(room_1.hotel)
          expect(page).to have_content(room_2.suite)
          expect(page).to have_content(room_2.rate)
          # expect(page).to have_content(room_2.name)
       
        }
      end
    end
  end
end