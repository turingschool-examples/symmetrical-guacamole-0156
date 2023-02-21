require 'rails_helper'

RSpec.describe '#index' do

before(:each) do
  @red_cliffs = Hotel.create!(name: "Red Cliffs Lodge", location: "Moab")
  @van_by_the_river = Hotel.create!(name: "Van Down By The River", location: "On Wheels")

  @conversion = @van_by_the_river.rooms.create(rate: 2, suite: "Sweet")
  @cabin = @red_cliffs.rooms.create!(rate: 125, suite: "Cabin")
  @river_side = @red_cliffs.rooms.create!(rate: 250, suite: "River Side")
  @castleton = @red_cliffs.rooms.create!(rate: 175, suite: "Castleton")

  @guest_1 = Guest.create!(name: "Nik", nights: 5)
  @guest_2 = Guest.create!(name: "Matt", nights: 2)

  GuestRoom.create!(guest: @guest_2, room: @cabin)
  GuestRoom.create!(guest: @guest_1, room: @cabin)
  GuestRoom.create!(guest: @guest_1, room: @river_side)
end

  describe 'as a user when I visit the index page' do
    it 'I should see a list of all the rooms, their attribute, and hotel name' do
      visit "/rooms"

      expect(page).to have_content(@conversion.suite)
      expect(page).to have_content "Rate: 2 Hotel: Van Down By The River"
      expect(page).to have_content(@cabin.suite)
      expect(page).to have_content(@river_side.suite)
      expect(page).to have_content(@castleton.suite)
    end

    it 'lists the number of guests that have stayed in each room' do 
      visit "/rooms"

      expect(page).to have_content "Number of Guests Stayed: 2"
      expect(page).to have_content "Number of Guests Stayed: 1"
      expect(page).to have_content "Number of Guests Stayed: 0"

    end
  end
end