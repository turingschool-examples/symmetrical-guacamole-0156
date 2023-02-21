require 'rails_helper'

RSpec.describe '/guests/:id', type: :feature do
  describe "when I visit a guest show page" do
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

    it "I see a list of all the rooms they've stayed in, rate, suite, & hotel it belongs to" do
      expect(page).to have_content("#{@guest1.name}'s Page")
      expect(page).to have_content("Past Stays:")
      expect(page).to have_content("#{@room1.suite} - rate: $#{@room1.rate}/night, hotel: #{@hotel1.name}")
      expect(page).to have_content("#{@room2.suite} - rate: $#{@room2.rate}/night, hotel: #{@hotel1.name}")
      expect(page).to have_content("#{@room3.suite} - rate: $#{@room3.rate}/night, hotel: #{@hotel2.name}")
      expect(page).to_not have_content("#{@room4.suite}")
    end

    it "I see a form to add a room to this guest" do
      expect(page).to have_content("Book a New Room:")
      expect(page).to have_field(:room_id)
      expect(page).to have_button("Submit")
    end

    it "I fill in the form with existing ID of room, click submit, redirected back & I see the new room" do
      fill_in("Book a New Room:", with: "#{@room4.id}")
      click_button("Submit")

      expect(current_path).to eq("/guests/#{@guest1.id}")
      expect(page).to have_content("#{@room4.suite} - rate: $#{@room4.rate}/night, hotel: #{@hotel2.name}")
    end

    it "can post error message" do
      fill_in("Book a New Room:", with: "Dorm Room 55")
      click_button("Submit")

      expect(page).to have_content("Room must exist")
    end

  end
end
