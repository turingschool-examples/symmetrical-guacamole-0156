require 'rails_helper'

RSpec.describe "Guest Show Page" do
  # Story 1
  # And I see a list of all the rooms they've stayed in
  # including the room's suite, nightly rate, and the name of the hotel that it belongs to.

  let!(:echo) { Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain") }
  # let!(:everest) { Hotel.create!(name: "Everest View Hotel", location: "Everest Mountain") }
  let!(:charlize) { Guest.create!(name: "Charlize Theron", nights: 3) }
  let!(:scarlett) { Guest.create!(name: "Scarlett Johansson", nights: 2) }
  let!(:presidential) { echo.rooms.create!(rate: 125, suite: "Presidential") }
  let!(:penthouse) { echo.rooms.create!(rate: 175, suite: "Penthouse") }

  before do
    GuestRoom.create!(guest: charlize, room: presidential)
    GuestRoom.create!(guest: scarlett, room: penthouse)

    visit "/guests/#{charlize.id}"
  end

  describe "When I visit /guests/:id" do
    it "I should see the guest names" do
      expect(page).to have_content("Name: Charlize Theron, Nights: 3")
    end

    it "I should see a list of all the rooms" do
      save_and_open_page
      expect(page).to have_content("Room: Presidential")
      expect(page).to have_content("Rate: 125")
      expect(page).to_not have_content("Room: Penthouse")
      expect(page).to_not have_content("Rate: 175")
    end
  end
end
