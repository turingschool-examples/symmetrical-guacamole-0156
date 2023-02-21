require 'rails_helper'

describe 'guest show page' do

  it 'user story 1' do 
    # As a visitor
    # When I visit a guest's show page
    # I see the guest's name
    # And I see a list of all the rooms they've stayed in
    # including the room's suite, nightly rate, and the name of the hotel that it belongs to.
    budapest = Hotel.create!(name: "Grand Budapest", location: 'Turkey')
    room1 = Room.create!(hotel_id: budapest.id, suite: "Presidential", rate: 125)
    room2 = Room.create!(hotel_id: budapest.id, suite: "Honeymoon", rate: 200)
    charlize = Guest.create!(name:"Charlize Theron", nights: 3)
    guest_room1 = GuestRoom.create!(room_id: room1.id, guest_id: charlize.id)
    guest_room2 = GuestRoom.create!(room_id: room2.id, guest_id: charlize.id)
    visit "guests/#{charlize.id}"
    expect(page).to have_content("Guest name: #{charlize.name}")
    expect(page).to have_content("Rooms Stayed in:")
    expect(page).to have_content("Suite: #{room1.suite}")
    expect(page).to have_content("Rate: #{room1.rate}")
    expect(page).to have_content("Hotel: #{budapest.name}")
    expect(page).to have_content("Suite: #{room2.suite}")
    expect(page).to have_content("Rate: #{room2.rate}")
  end
end