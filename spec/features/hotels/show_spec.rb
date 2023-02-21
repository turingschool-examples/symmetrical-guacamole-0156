require 'rails_helper'

RSpec.describe "Show", type: :feature do
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

    visit "/hotels/#{echo.id}"
  end

  describe "when I visit /hotels/:id" do
    context "I see" do
      it "a unique list of all guests that have stayed at this hotel." do
        binding.pry
        expect(page).to have_content("Jimmy")
        expect(page).to have_content("Naomi")
        expect(page).to have_content("Alex")
      end
    end
  end
end