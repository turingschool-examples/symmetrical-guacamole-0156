require 'rails_helper'

RSpec.describe "Index", type: :feature do
  let!(:echo) { Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain") }
  let!(:king) { echo.rooms.create!(rate: 125, suite: "King Bed Room") }
  let!(:twin) { echo.rooms.create!(rate: 75, suite: "Twin Bed Room") }
  let!(:pres) { echo.rooms.create!(rate: 200, suite: "Presidential Room") }
  let!(:jimmy) { Guest.create!(name: "Jimmy", nights: 3) }
  let!(:naomi) { Guest.create!(name: "Naomi", nights: 2) }
  let!(:alex) { Guest.create!(name: "Alex", nights: 4) }

  before do
    GuestRoom.create!(guest: jimmy, room: king)
    GuestRoom.create!(guest: jimmy, room: twin)
    GuestRoom.create!(guest: naomi, room: king)
    GuestRoom.create!(guest: naomi, room: pres)
    GuestRoom.create!(guest: alex, room: king)

    visit "/rooms"
  end
  describe "when I visit /rooms" do
    context "I see" do
      it "a list of all rooms including the room's suite, nightly rate, 
        and the name of the hotel that it belongs to" do
       
        expect(page).to have_content("Jimmy's Page")
        expect(page).to have_content("Suite: King Bed Room")
        expect(page).to have_content("Rate: $125.00")
        expect(page).to have_content("Suite: Twin Bed Room")
        expect(page).to have_content("Rate: $75.00")
        expect(page).to have_content("Suite: Presidential Room")
        expect(page).to have_content("Rate: $200.00")
        expect(page).to have_content("Hotel: Echo Mountain Inn")
      end

      xit "the number of guests that have stayed in that room." do
  
        expect(page).to have_content("King Bed Room: 3") 
        expect(page).to have_content("Twin Bed Room: 1")
        expect(page).to have_content("Presidential Room: 1")
      end
    end
  end
end