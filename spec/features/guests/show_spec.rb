require 'rails_helper'

RSpec.describe 'The Guest Show Page' do
  describe 'User Story 1' do
    it "shows the guest's name and a list of all the rooms they've stayed in, along with the room's attributes" do
      guest_1 = Guest.create!(name: "Dawson", nights: 4)
      hotel_1 = Hotel.create!(name: "Stanley Hotel", location: "Estes Park")
      room_1 = Room.create!(rate: 145, suite: "Single", hotel_id: hotel_1.id)
      room_2 = Room.create!(rate: 175, suite: "Double", hotel_id: hotel_1.id)
      room_3 = Room.create!(rate: 233, suite: "Penthouse", hotel_id: hotel_1.id)

      RoomGuest.create!(room: room_1, guest: guest_1)
      RoomGuest.create!(room: room_2, guest: guest_1)
      RoomGuest.create!(room: room_3, guest: guest_1)

      visit "/guests/#{guest_1.id}"

      expect(page).to have_content("Dawson")
      expect(page).to have_content("Single")
      expect(page).to have_content("Double")
      expect(page).to have_content("Penthouse")
      expect(page).to have_content(145)
      expect(page).to have_content(175)
      expect(page).to have_content(233)
      expect(page).to have_content("Stanley Hotel")
    end
  end
end