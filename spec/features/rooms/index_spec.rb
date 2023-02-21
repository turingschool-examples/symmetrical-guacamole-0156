require 'rails_helper'

RSpec.describe 'rooms index page' do
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
    RoomGuest.create!(room: room2, guest: guest2)
    RoomGuest.create!(room: room3, guest: guest2)

  end

  describe 'as a visitor to room index page' do
    it 'I see a list of all rooms, including room suite, rate and the name of the hotel it belongs to, and number of guests that have stayed in room' do

      visit "/rooms"

      expect(page).to have_content("Suite Name: Presidential")
      expect(page).to have_content("Suite Name: Standard")
      expect(page).to have_content("Suite Name: Balcony Standard")

      expect(page).to have_content("Nightly Rate: $125")
      expect(page).to have_content("Nightly Rate: $225")
      expect(page).to have_content("Nightly Rate: $195")

      expect(page).to have_content('Hotel: Echo Mountain Inn')
      expect(page).to have_content("Hotel: Snowed Inn")
      expect(page).to have_content("Hotel: Loveland Hotel")

      expect(page).to have_content("Number of guests who have stayed: 1")
      expect(page).to have_content("Number of guests who have stayed: 2")
    end
  end
end