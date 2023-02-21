require 'rails_helper'

RSpec.describe "hotel show page" do
  before do
    @hotel1 = Hotel.create!(name: "Holiday Inn", location: "Las Vegas")
    @hotel2 = Hotel.create!(name: "Mariott", location: "Austin")
    @hotel3 = Hotel.create!(name: "Condor", location: "Denver")

    @room1 = @hotel1.rooms.create!(rate: 150, suite: "Economy")
    @room2 = @hotel2.rooms.create!(rate: 275, suite: "Double")
    @room3 = @hotel1.rooms.create!(rate: 350, suite: "First Class")
    @room4 = @hotel3.rooms.create!(rate: 575, suite: "Penthouse")

    @guest1 = @room1.guests.create!(name: "Bob", nights: 3)
    @guest2 = @room1.guests.create!(name: "Shane", nights: 10)
    @guest3 = @room1.guests.create!(name: "Isaac", nights: 13)

    GuestRoom.create!(guest: @guest1, room: @room2)
    GuestRoom.create!(guest: @guest1, room: @room3)
    GuestRoom.create!(guest: @guest2, room: @room2)
    GuestRoom.create!(guest: @guest3, room: @room3)

    visit hotel_path(@hotel1)
  end

  scenario "When I visit hotel's show page" do
    expect(current_path).to eq("/hotels/#{@hotel1.id}")
  end
  
  # scenario "I see a unique list of guest names" do
  #   expect(page).to have_content("Bob").once
  #   expect(page).to have_content(@guest1.name).once
  #   expect(page).to_not have_content("Shane").once
  #   expect(page).to_not have_content(@guest2.name).once
  #   expect(page).to_not have_content("Isaac").once
  #   expect(page).to_not have_content(@guest3.name).once
  # end
end