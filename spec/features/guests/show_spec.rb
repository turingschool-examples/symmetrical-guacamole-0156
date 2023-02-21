require 'rails_helper'

RSpec.describe 'guests show page' do
  let!(:hotel1) {Hotel.create!(name: 'Echo Mountain Inn', location: "Echo Mountain")}
  let!(:hotel2) {Hotel.create!(name: 'Loveland Hotel', location: "Loveland")}
  
  let!(:room1) {Room.create!(rate: 125, suite: "Presidential", hotel_id: hotel1.id)}
  let!(:room2) {Room.create!(rate: 225, suite: "Standard", hotel_id: hotel2.id)}

  let!(:guest1) {Guest.create!(name: "Charlize Theron", nights: 3)}

  before do
    RoomGuest.create!(room: room1, guest: guest1)
    RoomGuest.create!(room: room2, guest: guest1)

  end

  describe 'when visitor visits guest show page' do
    it 'show list of all rooms they have stayed in, including room suite,nightly rate and name of the hotel it belongs to' do

      visit "/guests/#{guest1.id}"

      save_and_open_page
      expect(page).to have_content("Guest Name: Charlize Theron")
      expect(page).to have_content("Hotels stayed in:")
      expect(page).to have_content("Suite: Presidential")
      expect(page).to have_content("Rate: 125")
      expect(page).to have_content("Name of hotel: Echo Mountain Inn")

   
    end
  end
end