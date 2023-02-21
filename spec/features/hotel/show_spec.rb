require 'rails_helper'

describe 'extension' do
  # Extension

  # As a visitor,
  # When I visit a hotel's show page,
  # Then I see a unique list of all guests that have stayed at this hotel.
  it 'has a list of all unique guests' do
    budapest = Hotel.create!(name: "Grand Budapest", location: 'Turkey')
    room1 = Room.create!(hotel_id: budapest.id, suite: "Presidential", rate: 125)
    charlize = Guest.create!(name:"Charlize Theron", nights: 3)
    danny = Guest.create!(name:"Danny", nights: 2)
    mark = Guest.create!(name:"Mark", nights: 3) 
    guest_room1 = GuestRoom.create!(room_id: room1.id, guest_id: charlize.id)
    guest_room2 = GuestRoom.create!(room_id: room1.id, guest_id: danny.id)
    guest_room3 = GuestRoom.create!(room_id: room1.id, guest_id: mark.id)
    visit "/hotels/#{budapest.id}"
    expect(page).to have_content("#{@hotel.name} Show Page")
    expect(page).to have_content("List of Guests")
    expect(page).to have_content(charlize.name)
    expect(page).to have_content(danny.name)
    expect(page).to have_content(mark.name)
  end
end