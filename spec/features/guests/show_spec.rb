require 'rails_helper'

RSpec.describe '/guests/:id', type: :feature do
  describe "when I visit a guest show page I see" do
    before do
      @hotel1 = Hotel.create!(name: "Ritz-Carlton", location: "Paris")
      @hotel2 = Hotel.create!(name: "St. Regis", location: "Geneva")

      @room1 = Room.create!(rate: 300, suite: "Penthouse", hotel_id: @hotel1.id)
      @room2 = Room.create!(rate: 400, suite: "Rooftop Bungalow", hotel_id: @hotel1.id)
      @room3 = Room.create!(rate: 200, suite: "Loft", hotel_id: @hotel2.id)
      @room4 = Room.create!(rate: 450, suite: "Honeymoon", hotel_id: @hotel2.id)

      @guest1 = Guest.create!(name: "Letti")

      GuestRoom.create!(room: @room1, guest: @guest1)
      GuestRoom.create!(room: @room2, guest: @guest1)
      GuestRoom.create!(room: @room3, guest: @guest1)

      visit "/guests/#{@guest1.id}"
    end

    it "a list of all the rooms they've stayed in, rate, suite, & hotel it belongs to" do
      expect(page).to have_content("#{@guest1.name}'s Page")
      expect(page).to have_content("Past Stays:")
      expect(page).to have_content("#{@room1.suite} - rate: $#{@room1.rate}/night, hotel: #{@hotel1.name}")
      expect(page).to have_content("#{@room2.suite} - rate: $#{@room2.rate}/night, hotel: #{@hotel1.name}")
      expect(page).to have_content("#{@room3.suite} - rate: $#{@room3.rate}/night, hotel: #{@hotel2.name}")
      expect(page).to_not have_content("#{@room4.suite}")
    end

  end
end
