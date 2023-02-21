require 'rails_helper'

RSpec.describe "Show", type: :feature do
  let!(:echo) { Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain") }
  let!(:king) { echo.rooms.create!(rate: 125, suite: "King Bed Room") }
  let!(:twin) { echo.rooms.create!(rate: 75, suite: "Twin Bed Room") }
  let!(:pres) { echo.rooms.create!(rate: 200, suite: "Presidential Room") }
  let!(:jimmy) { echo.rooms.create!(name: "Jimmy", nights: 3) }

  before do
    GuestRoom.create!(guest: jimmy, room: king)
    GuestRoom.create!(guest: jimmy, room: twin)

    visit "/guests/#{jimmy.id}"
  end

  describe "when I visit /guests/:id" do
    context "I see" do
      it "I see the guest's name and I see a list of all the rooms they've stayed in
        including the room's suite, nightly rate, and the name of the hotel that it belongs to." do

          expect(page).to have_content("Jimmy's Page")
          expect(page).to have_content("King Bed Room")
          expect(page).to have_content("$125.00")
          expect(page).to have_content("Twin Bed Room")
          expect(page).to have_content("$75.00")
          expect(page).to have_content("Echo Mountain Inn")
          expect(page).to_not have_content("Presidential Room")
          expect(page).to_not have_content("$200.00")
      end
    end
  end
end