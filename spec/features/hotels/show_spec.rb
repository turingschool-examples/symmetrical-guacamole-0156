require 'rails_helper'

RSpec.describe '#show' do

before(:each) do
  @red_cliffs = Hotel.create!(name: "Red Cliffs Lodge", location: "Moab")
  @cabin = @red_cliffs.rooms.create!(rate: 125, suite: "Cabin")
  @river_side = @red_cliffs.rooms.create!(rate: 250, suite: "River Side")
  @castleton = @red_cliffs.rooms.create!(rate: 175, suite: "Castleton")
  @guest_1 = Guest.create!(name: "Nik", nights: 5)
  @guest_2 = Guest.create!(name: "Matt", nights: 2)
  @guest_3 = Guest.create!(name: "Jimmy", nights: 2)

  GuestRoom.create!(guest: @guest_2, room: @cabin)
  GuestRoom.create!(guest: @guest_1, room: @cabin)
  GuestRoom.create!(guest: @guest_1, room: @river_side)
end

  describe 'As a user when I visit a hotels show page' do 
    it 'I should see a list of all unique guests who have stayed at the hotel' do 

      visit "/hotels/#{@red_cliffs.id}"

      expect(page).to have_content "Guests:"
      expect(page).to have_content "Nik"
      expect(page).to have_content "Matt"
      expect(page).to_not have_content "Jimmy"
    end
  end
end