require 'rails_helper'

RSpec.describe 'Show Page' do
  let!(:gold) { Hotel.create!(name: "Gold", location: 'Denver')}
  let!(:junior) { gold.rooms.create!(rate: 150, suite: "Junior")}
  let!(:deluxe) { gold.rooms.create!(rate: 250, suite: "Deluxe")}
  let!(:super) { gold.rooms.create!(rate: 200, suite: "Super")}
  let!(:max) { Guest.create!(name: "Max", nights: 3)}
  
  before do
    RoomGuest.create!(room: junior, guest: max)
    RoomGuest.create!(room: deluxe, guest: max)

    visit "/guests/#{max.id}"
  end

  describe 'when I visit /guests/:id' do
    it 'I should see the guest names' do
      expect(page).to have_content("name: #{max.name}")
    end

    it "I should see the list of all the rooms with it attributes and the hotel name" do
      expect(page).to have_content("suite: Junior")
      expect(page).to have_content("rate: 150")
      expect(page).to have_content("suite: Deluxe")
      expect(page).to have_content("rate: 250")
      expect(page).to have_content("Hotel Name: Gold")
    end

    it "I should see a form to add room" do
      expect(page).to have_content("Add Room:")
      expect(page).to have_field(:room_id)
      expect(page).to have_button("Submit")
    end

    it "when I fill in the form I should be redirect back to the guest show page with the added room" do
      fill_in :room_id, with: "#{@super.id}"
      click_button "Submit"

      expect(current_path).to eq("/guests/#{max.id}")
      expect(page).to have_content("Super")
    end
  end

end