require 'rails_helper'

RSpec.describe "Rooms Index Page" do

  let!(:echo) { Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain") }
  let!(:everest) { Hotel.create!(name: "Everest View Hotel", location: "Everest Mountain") }
  let!(:charlize) { Guest.create!(name: "Charlize Theron", nights: 3) }
  let!(:scarlett) { Guest.create!(name: "Scarlett Johansson", nights: 2) }
  let!(:keanu) { Guest.create!(name: "Keanu Reeves", nights: 4) }
  let!(:presidential) { echo.rooms.create!(rate: 125, suite: "Presidential") }
  let!(:penthouse) { everest.rooms.create!(rate: 175, suite: "Penthouse") }

  before do
    GuestRoom.create!(guest: charlize, room: presidential)
    GuestRoom.create!(guest: scarlett, room: penthouse)
    GuestRoom.create!(guest: keanu, room: penthouse)

    visit "/rooms"
  end

  # Story 3

  describe "When I visit /rooms" do
    it "I should see a list of all the rooms" do
      expect(page).to have_content("Room: Presidential")
      expect(page).to have_content("Rate: 125")
      expect(page).to have_content("Hotel Name: Echo Mountain Inn")
      expect(page).to have_content("Number of Guests: 1")

      expect(page).to have_content("Room: Penthouse")
      expect(page).to have_content("Rate: 175")
      expect(page).to have_content("Hotel Name: Everest View Hotel")
      expect(page).to have_content("Number of Guests: 1")
      # save_and_open_page
    end
  end
end