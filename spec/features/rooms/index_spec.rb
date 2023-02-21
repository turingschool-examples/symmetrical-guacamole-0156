require 'rails_helper'

RSpec.describe "index", type: :feature do
  let!(:aspen) { Hotel.create!(name: "Tyrolean Inn", location: "Aspen") }
  let!(:bum) { aspen.rooms.create!(rate: 100, suite: "Ski Bum") }
  let!(:shack) { aspen.rooms.create!(rate: 150, suite: "Love Shack") }
  let!(:high) { aspen.rooms.create!(rate: 200, suite: "High Roller") }
  let!(:steve) { Guest.create!(name: "Steve", nights: 2) }
  let!(:stevie) { Guest.create!(name: "Stevie", nights: 1) }

  before do
    GuestRoom.create!(guest: steve, room: bum)
    GuestRoom.create!(guest: steve, room: shack)
    GuestRoom.create!(guest: stevie, room: high)
    
    visit "/rooms"
  end
  describe "when I visit the room index page" do
    context "I see"
      it 'a list of all rooms, their hotel, and nightly rate' do
        expect(page).to have_content("High Roller - Tyrolean Inn")
        expect(page).to have_content("Ski Bum - Tyrolean Inn")
        expect(page).to have_content("Love Shack - Tyrolean Inn")
        expect(page).to have_content("Nightly Rate: $100.00")
        expect(page).to have_content("Nightly Rate: $150.00")
        expect(page).to have_content("Nightly Rate: $200.00")
      end

      it 'the number of guests that have stayed in the rooms' do
        
      end
  end
end