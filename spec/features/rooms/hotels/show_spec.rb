require 'rails_helper'

RSpec.describe '/hotels/:id', type: :feature do
  describe "when I visit a hotel show page" do
    before do
      @hotel1 = Hotel.create!(name: "Ritz-Carlton", location: "Paris")

      @room1 = Room.create!(rate: 300, suite: "Penthouse", hotel_id: @hotel1.id)
      @room2 = Room.create!(rate: 400, suite: "Rooftop Bungalow", hotel_id: @hotel1.id)

      @guest1 = Guest.create!(name: "Letti")
      @guest2 = Guest.create!(name: "Calum")
      @guest3 = Guest.create!(name: "Nika")

      GuestRoom.create!(room: @room1, guest: @guest1)
      GuestRoom.create!(room: @room2, guest: @guest1)
      GuestRoom.create!(room: @room1, guest: @guest2)

      visit "hotels/#{@hotel1.id}"
    end 

    it "I see a unique list of all guests that have stayed at this hotel" do
      expect(page).to have_content("#{@hotel1.name}'s Page")
      expect(page).to have_content("All Guests who've stayed with us:")
      expect(page).to have_content("#{@guest1.name}")
      expect(page).to have_content("#{@guest2.name}")
      expect(page).to_not have_content("#{@guest3.name}")
    end
  end
end
