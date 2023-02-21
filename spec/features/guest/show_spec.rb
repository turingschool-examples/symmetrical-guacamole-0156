require 'rails_helper'

RSpec.describe "guest show page" do
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

    GuestRoom.create!(guest: @guest1, room: @room2)
    GuestRoom.create!(guest: @guest1, room: @room3)
    GuestRoom.create!(guest: @guest2, room: @room2)

    visit guest_path(@guest1)
  end

  scenario "When I visit guest's  show page" do
    expect(current_path).to eq("/guests/#{@guest1.id}")
  end

  scenario "I see the guest's name" do
    expect(page).to have_content("Bob")
    expect(page).to have_content(@guest1.name)
    expect(page).to_not have_content("Shane")
    expect(page).to_not have_content(@guest2.name)
  end

  scenario "I see a list of all the rooms they've stayed in" do
    expect(page).to have_content("Economy")
    expect(page).to have_content("Double")
    expect(page).to have_content("First Class")
    expect(page).to have_content(@room1.suite)
    expect(page).to have_content(@room2.suite)
    expect(page).to have_content(@room3.suite)

    expect(page).to_not have_content("Penthouse")
    expect(page).to_not have_content(@room4.suite)
  end

  scenario "I see a said rooms' nightly rates and the name of the hotel they belong to." do
    save_and_open_page
    expect(page).to have_content(150)
    expect(page).to have_content(275)
    expect(page).to have_content(350)
    expect(page).to have_content(@room1.rate)
    expect(page).to have_content(@room2.rate)
    expect(page).to have_content(@room3.rate)

    expect(page).to have_content("Holiday Inn")
    expect(page).to have_content("Mariott")
    expect(page).to have_content(@hotel1.name)
    expect(page).to have_content(@hotel2.name)

    expect(page).to_not have_content("575")
    expect(page).to_not have_content(@room4.rate)
    expect(page).to_not have_content("Condor")
    expect(page).to_not have_content(@hotel3.name)
  end
end