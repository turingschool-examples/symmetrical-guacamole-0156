require 'rails_helper'

RSpec.describe "/guests/show", type: :feature do
  let!(:aspen) { Hotel.create!(name: "Tyrolean Inn", location: "Aspen") }
  let!(:vail) { Hotel.create!(name: "Lodge at Vail", location: "Vail") }
  let!(:bum) { aspen.rooms.create!(rate: 100, suite: "Ski Bum") }
  let!(:shack) { aspen.rooms.create!(rate: 150, suite: "Love Shack") }
  let!(:high) { aspen.rooms.create!(rate: 200, suite: "High Roller") }
  let!(:steve) { Guest.create!(name: "Steve", nights: 2) }
  let!(:stevie) { Guest.create!(name: "Stevie", nights: 1) }
  

  before do
    GuestRoom.create!(guest: steve, room: bum)
    GuestRoom.create!(guest: steve, room: shack)
    GuestRoom.create!(guest: stevie, room: high)
    visit "/guests/#{steve.id}"
  end

  describe "when I visit a guest's show page" do
    context "I see" do
      it "the guest name, the rooms they've stayed in, and the rooms suite name, rate, and name of the hotel" do
        expect(page).to have_content("Steve")
        expect(page).to have_content("Ski Bum")
        expect(page).to have_content("Love Shack")
        expect(page).to have_content("Nightly Rate: $100.00")
        expect(page).to have_content("Nightly Rate: $150.00")
        expect(page).to have_content("Tyrolean Inn")
        expect(page).to_not have_content("Lodge at Vail")
        expect(page).to_not have_content("Stevie")
        expect(page).to_not have_content("High Roller")
        expect(page).to_not have_content("Nightly Rate: $200.00")
      end

      it 'has a form to add a room to this guest' do
        expect(page).to have_field(:room_id)
        expect(page).to have_button("Submit")
      end
    end
    context 'when I fill out the form and click submit' do
      it 'redirects me back to the guest show page and displays added room' do
        fill_in :room_id, with: high.id
        click_on "Submit"

        expect(current_path).to eq("/guests/#{steve.id}")
        expect(page).to have_content("High Roller")
        expect(page).to have_content("Nightly Rate: $200.00")
        expect(page).to have_content("Tyrolean Inn")
      end
    end
  end
end