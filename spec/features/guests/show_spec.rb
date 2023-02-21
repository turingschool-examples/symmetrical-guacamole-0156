require 'rails_helper'

RSpec.describe 'guests show page' do
  let!(:hotel1) {Hotel.create!(name: 'Echo Mountain Inn', location: "Echo Mountain")}
  let!(:hotel2) {Hotel.create!(name: 'Loveland Hotel', location: "Loveland")}
  let!(:hotel3) {Hotel.create!(name: 'Snowed Inn', location: "Copper Mountain")}
  
  let!(:room1) {Room.create!(rate: 125, suite: "Presidential", hotel_id: hotel1.id)}
  let!(:room2) {Room.create!(rate: 225, suite: "Standard", hotel_id: hotel2.id)}
  let!(:room3) {Room.create!(rate: 195, suite: "Balcony Standard", hotel_id: hotel3.id)}

  let!(:guest1) {Guest.create!(name: "Charlize Theron", nights: 3)}
  let!(:guest2) {Guest.create!(name: "Tim Allen", nights: 2)}

  before do
    RoomGuest.create!(room: room1, guest: guest1)
    RoomGuest.create!(room: room2, guest: guest1)

  end

  describe 'when visitor visits guest show page' do
    it 'show list of all rooms they have stayed in, including room suite,nightly rate and name of the hotel it belongs to' do

      visit "/guests/#{guest1.id}"

      expect(page).to have_content("Guest Name: Charlize Theron")
      expect(page).to have_content("Hotels stayed in:")
      expect(page).to have_content("Suite: Presidential")
      expect(page).to have_content("Rate: $125")
      expect(page).to have_content("Name of hotel: Echo Mountain Inn")
      expect(page).to_not have_content("Guest Name: Tim Allen")

    end

    it 'has a form to add a room to this guest' do
      visit "/guests/#{guest1.id}"

      expect(page).to have_field(:room_id)
      expect(page).to have_button("Submit")
    end
    
    describe 'when I fill out room form, click submit' do
      it "then I am redirected back to the guest's show page and see room now listed under guest" do
        visit "/guests/#{guest1.id}"
        
        fill_in :room_id, with: "#{room3.id}"
        click_on "Submit"

        expect(current_path).to eq("/guests/#{guest1.id}")
        expect(page).to have_content("Suite: Balcony Standard")
        expect(page).to have_content("Rate: $195")
        expect(page).to have_content("Name of hotel: Snowed Inn")
      end
    end
  end
end