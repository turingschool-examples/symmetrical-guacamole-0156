require 'rails_helper'

describe 'room index' do

  describe 'user story 3' do
    # Story 3
    # Rooms Index

    # As a visitor
    # When I visit the rooms index page
    # Then I see a list of all rooms
    # including the room's suite, nightly rate, and the name of the hotel that it belongs to
    # and the number of guests that have stayed in that room.

    it 'has a list of all the rooms' do
      budapest = Hotel.create!(name: "Grand Budapest", location: 'Turkey')
      room1 = Room.create!(hotel_id: budapest.id, suite: "Presidential", rate: 125)
      euro = Hotel.create!(name: "Grand Europa", location: 'Prague')
      room2 = Room.create!(hotel_id: euro.id, suite: "Economy", rate: 60)
      visit '/rooms'
      expect(page).to have_content(room1.suite)
      expect(page).to have_content(room1.rate)
      expect(page).to have_content(room1.hotel_name)
      expect(page).to have_content(room1.number_of_guests)

      expect(page).to have_content(room2.suite)
      expect(page).to have_content(room2.rate)
      expect(page).to have_content(room2.number_of_guests)
    end
  end
end