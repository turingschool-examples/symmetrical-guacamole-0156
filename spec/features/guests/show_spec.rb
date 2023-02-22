require 'rails_helper'

RSpec.describe "Guest Show Page" do
  
  # Story 1
  let!(:echo) { Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain") }
  let!(:everest) { Hotel.create!(name: "Everest View Hotel", location: "Everest Mountain") }
  let!(:charlize) { Guest.create!(name: "Charlize Theron", nights: 3) }
  let!(:scarlett) { Guest.create!(name: "Scarlett Johansson", nights: 2) }
  let!(:presidential) { echo.rooms.create!(rate: 125, suite: "Presidential") }
  let!(:penthouse) { everest.rooms.create!(rate: 175, suite: "Penthouse") }

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
      # save_and_open_page
      expect(page).to have_content("Room: Presidential")
      expect(page).to have_content("Rate: 125")
      expect(page).to have_content("Hotel Name: Echo Mountain Inn")

      expect(page).to_not have_content("Room: Penthouse")
      expect(page).to_not have_content("Rate: 175")
      expect(page).to_not have_content("Hotel Name: Everest View Hotel")
    end
  end

  # Story 2
  describe "When I visit /guests/:id" do
    it "I should see a form to add a room to this guest" do
      
      fill_in :room_id, with: penthouse.id
      click_on "Submit"
      # save_and_open_page

      expect(current_path).to eq("/guests/#{charlize.id}")
      expect(page).to have_field(:room_id)
      expect(page).to have_button("Submit")
    end
  end
end
