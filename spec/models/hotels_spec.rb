require 'rails_helper' 

RSpec.describe Hotel do 
  describe '#instance methods' do 
    it '#unique_guests' do 
      hotel = Hotel.create!(name: "Marriott", location: "Denver")
      guest_1 = Guest.create!(name: "Brian", nights: 2)
      guest_2 = Guest.create!(name: "Brian", nights: 2)
      room_1 = Room.create!(rate: 100, suite: "President suite", hotel_id: hotel.id)
      room_2 = Room.create!(rate: 150, suite: "Honeymoon Suite", hotel_id: hotel.id)
      RoomGuest.create!(room: room_1, guest: guest_1)
      RoomGuest.create!(room: room_2, guest: guest_2 )
      RoomGuest.create!(room: room_2, guest: guest_1)

      expect(hotel.unique_guests).to eq([guest_1, guest_2])
    end
  end
end