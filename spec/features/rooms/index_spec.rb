require 'rails_helper'

RSpec.describe "The Room Index" do
  describe "User Story 3" do
    it "shows the visitor a list of all rooms along with their attributes" do
      guest_1 = Guest.create!(name: "Dawson", nights: 4)
      hotel_1 = Hotel.create!(name: "Stanley Hotel", location: "Estes Park")
      room_1 = Room.create!(rate: 145, suite: "Single", hotel_id: hotel_1.id)
      room_2 = Room.create!(rate: 175, suite: "Double", hotel_id: hotel_1.id)
      room_3 = Room.create!(rate: 233, suite: "Penthouse", hotel_id: hotel_1.id)

      visit "/rooms"

      expect(page).to have_content("Single")
      expect(page).to have_content("Double")
      expect(page).to have_content("Penthouse")
      expect(page).to have_content(145)
      expect(page).to have_content(175)
      expect(page).to have_content(233)
      expect(page).to have_content("Stanley Hotel")

    end

    it "shows the number of guests that have stayed in that room" do
      guest_1 = Guest.create!(name: "Dawson", nights: 4)
      guest_2 = Guest.create!(name: "Sam", nights: 2)
      guest_3 = Guest.create!(name: "Mel", nights: 5)
      hotel_1 = Hotel.create!(name: "Stanley Hotel", location: "Estes Park")
      room_1 = Room.create!(rate: 145, suite: "Single", hotel_id: hotel_1.id)
      room_2 = Room.create!(rate: 175, suite: "Double", hotel_id: hotel_1.id)
      room_3 = Room.create!(rate: 233, suite: "Penthouse", hotel_id: hotel_1.id)

      RoomGuest.create!(room: room_1, guest: guest_1)
      RoomGuest.create!(room: room_2, guest: guest_1)
      RoomGuest.create!(room: room_1, guest: guest_2)
      RoomGuest.create!(room: room_2, guest: guest_2)
      RoomGuest.create!(room: room_3, guest: guest_2)
      RoomGuest.create!(room: room_1, guest: guest_3)
      
      visit "/rooms"
      
      within "#count-#{room_1.id}" do
        expect(page).to have_content(3)
      end

      within "#count-#{room_2.id}" do
        expect(page).to have_content(2)
      end

      within "#count-#{room_3.id}" do
        expect(page).to have_content(1)
      end

    end
  end
end