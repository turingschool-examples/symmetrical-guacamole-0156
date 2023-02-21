require 'rails_helper'

RSpec.describe '/rooms', type: :feature do
  describe "when I visit teh rooms index page" do
    
    before do
      @hotel1 = Hotel.create!(name: "Ritz-Carlton", location: "Paris")
      @hotel2 = Hotel.create!(name: "St. Regis", location: "Geneva")

      @room1 = Room.create!(rate: 300, suite: "Penthouse", hotel_id: @hotel1.id)
      @room2 = Room.create!(rate: 400, suite: "Rooftop Bungalow", hotel_id: @hotel1.id)
      @room3 = Room.create!(rate: 200, suite: "Loft", hotel_id: @hotel2.id)
      @room4 = Room.create!(rate: 450, suite: "Honeymoon", hotel_id: @hotel2.id)

      @guest1 = Guest.create!(name: "Letti")
      @guest2 = Guest.create!(name: "Calum")
      @guest3 = Guest.create!(name: "Nika")

      GuestRoom.create!(room: @room1, guest: @guest1)
      GuestRoom.create!(room: @room1, guest: @guest1)
      GuestRoom.create!(room: @room2, guest: @guest1)

      GuestRoom.create!(room: @room1, guest: @guest2)
      GuestRoom.create!(room: @room2, guest: @guest2)

      GuestRoom.create!(room: @room2, guest: @guest3)

      visit "/rooms"
    end

    it "I see a list of all rooms, suite, rate, & hotel it belongs to" do
      expect(page).to have_content("All Rooms")
      expect(page).to have_content("#{@room1.suite} - rate: $#{@room1.rate}/night, hotel: #{@hotel1.name}")
      expect(page).to have_content("#{@room2.suite} - rate: $#{@room2.rate}/night, hotel: #{@hotel1.name}")
      expect(page).to have_content("#{@room3.suite} - rate: $#{@room3.rate}/night, hotel: #{@hotel2.name}")
    end

    it "I see the number of guests that have stayed in that room" do
      within "#room_info-#{@room1.id}" do
        expect(page).to have_content("Total Count of Guests: 2")
      end

      within "#room_info-#{@room2.id}" do
        expect(page).to have_content("Total Count of Guests: 3")
      end

      within "#room_info-#{@room3.id}" do
        expect(page).to have_content("Total Count of Guests: 0")
      end
    end

  end
end
