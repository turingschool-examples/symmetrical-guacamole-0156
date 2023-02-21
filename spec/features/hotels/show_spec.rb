require 'rails_helper'

RSpec.describe 'Hotel Show' do 
  describe 'as a visitor' do 
    describe 'when I visit a Hotel show page' do 
      it 'will have a unique list of guests named who have stayed at this hotel' do 
        hotel = Hotel.create!(name: "Marriott", location: "Denver")
        guest_1 = Guest.create!(name: "Brian", nights: 2)
        guest_2 = Guest.create!(name: "John", nights: 2)
        room_1 = Room.create!(rate: 100, suite: "President suite", hotel_id: hotel.id)
        room_2 = Room.create!(rate: 150, suite: "Honeymoon Suite", hotel_id: hotel.id)
        RoomGuest.create!(room: room_1, guest: guest_1)
        RoomGuest.create!(room: room_2, guest: guest_2 )
        RoomGuest.create!(room: room_2, guest: guest_1)
  

        visit "/hotels/#{hotel.id}"

        within('.guests') {
        expect(page).to have_content(guest_1.name)
        expect(page).to have_content(guest_2.name)
        }
        
      end 
    end 
  end 
end 