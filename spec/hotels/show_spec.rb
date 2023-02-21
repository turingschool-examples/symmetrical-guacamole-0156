require 'rails_helper'

RSpec.describe 'hotels show page' do
  let!(:hotel1) {Hotel.create!(name: 'Echo Mountain Inn', location: "Echo Mountain")}
  let!(:hotel2) {Hotel.create!(name: 'Loveland Hotel', location: "Loveland")}
 
  let!(:room1) {Room.create!(rate: 125, suite: "Presidential", hotel_id: hotel1.id)}
  let!(:room2) {Room.create!(rate: 225, suite: "Honeymoon Suite", hotel_id: hotel1.id)}

  let!(:guest1) {Guest.create!(name: "Charlize Theron", nights: 3)}
  let!(:guest2) {Guest.create!(name: "Tim Allen", nights: 2)}

  before do
    RoomGuest.create!(room: room1, guest: guest1)
    RoomGuest.create!(room: room2, guest: guest1)
    RoomGuest.create!(room: room1, guest: guest2)
  end
  
  describe 'as a visitor to hotel show page' do
    it "I see a unique list of all the guests that have stayed at this hotel" do
      visit "/hotels/#{hotel1.id}"
      
      expect(page).to_not have_content("Loveland Hotel")
      expect(page).to have_content("List of guests who have stayed at #{hotel1.name}")
      expect(page).to have_content("Charlize Theron")
      expect(page).to have_content("Tim Allen")
    save_and_open_page
    end
  end
end