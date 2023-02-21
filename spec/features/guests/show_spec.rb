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

        visit "/guests/#{guest.id}"

        expect(page).to have_content("Name: #{guest.name}")
        
        within('.rooms') {
          expect(page).to have_content(room_1.suite)
          expect(page).to have_content(room_1.rate)
          expect(page).to have_content(room_1.hotel.name)
          expect(page).to have_content(room_2.suite)
          expect(page).to have_content(room_2.rate)
          expect(page).to have_content(room_2.hotel.name)
       
        }
      end

      it 'will have render a form to add a room to this guest' do 
        hotel = Hotel.create!(name: "Marriott", location: "Denver")
        guest = Guest.create!(name: "Brian", nights: 2)
        room_1 = Room.create!(rate: 100, suite: "President suite", hotel_id: hotel.id)
        room_2 = Room.create!(rate: 150, suite: "Honeymoon Suite", hotel_id: hotel.id)
        room_3 = Room.create!(rate: 1000, suite: "Space Suite", hotel_id: hotel.id)
        RoomGuest.create!(room: room_1, guest: guest )
        RoomGuest.create!(room: room_2, guest: guest )

        visit "/guests/#{guest.id}"
        
        within('.form') {
        expect(page).to have_content('Add a New Room')
        expect(page).to have_field(:room_id)
        }
      end

      it 'will have the ability to fill form out and add a new room' do 
        hotel = Hotel.create!(name: "Marriott", location: "Denver")
        guest = Guest.create!(name: "Brian", nights: 2)
        room_1 = Room.create!(rate: 100, suite: "President suite", hotel_id: hotel.id)
        room_2 = Room.create!(rate: 150, suite: "Honeymoon Suite", hotel_id: hotel.id)
        room_3 = Room.create!(rate: 1000, suite: "Space Suite", hotel_id: hotel.id)
        RoomGuest.create!(room: room_1, guest: guest )
        RoomGuest.create!(room: room_2, guest: guest )

        visit "/guests/#{guest.id}"

        within('.rooms') {
          expect(page).to have_no_content(room_3.suite)
          expect(page).to have_no_content(room_3.rate)
          expect(page).to have_no_content(room_3.hotel.name)
        }

        fill_in :room_id, with: room_3.id
        click_button 'submit'

        expect(page).to have_current_path("/guests/#{guest.id}")
        
        within('.rooms') {
          expect(page).to have_content(room_3.suite)
          expect(page).to have_content(room_3.rate)
          expect(page).to have_content(room_3.hotel.name)
        }
      end 
    end
  end
end