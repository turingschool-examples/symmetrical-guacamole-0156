require 'rails_helper'

describe "When I visit the rooms index page", type: :feature do
  before(:each) do
    @hilton = Hotel.create!(name: "Hilton", location: "Hawaii")
    @double_tree = Hotel.create!(name: "DoubleTree", location: "Los Angeles")
    
    @jasmine = Guest.create!(name: "Jasmine", nights: 2)
    @ivan = Guest.create!(name: "Ivan", nights: 2)
    @hailey = Guest.create!(name: "Hailey", nights: 1)

    @penthouse = @hilton.rooms.create!(rate: 350, suite: "Penthouse")
    @king = @hilton.rooms.create!(rate: 175, suite: "King")
    @double = @double_tree.rooms.create!(rate: 190, suite: "Double")

    GuestRoom.create!(guest: @jasmine, room: @penthouse)
    GuestRoom.create!(guest: @jasmine, room: @king)
    GuestRoom.create!(guest: @ivan, room: @king)
    GuestRoom.create!(guest: @ivan, room: @double)
    GuestRoom.create!(guest: @hailey, room: @king)
    GuestRoom.create!(guest: @hailey, room: @double)
  end

  describe 'User Story 3' do
    it "lists all the rooms, including the room's suite, nightly rate, and the name of the hotel that it belongs to" do
      visit "/rooms"

      within "##{@penthouse.suite}" do
        expect(page).to have_content("Suite: #{@penthouse.suite}")
        expect(page).to have_content("Nightly Rate: $#{@penthouse.rate}")
        expect(page).to have_content("Hotel: #{@hilton.name}")
      end

      within "##{@king.suite}" do
        expect(page).to have_content("Suite: #{@king.suite}")
        expect(page).to have_content("Nightly Rate: $#{@king.rate}")
        expect(page).to have_content("Hotel: #{@hilton.name}")
      end

      within "##{@double.suite}" do
        expect(page).to have_content("Suite: #{@double.suite}")
        expect(page).to have_content("Nightly Rate: $#{@double.rate}")
        expect(page).to have_content("Hotel: #{@double_tree.name}")
      end
    end

    it "displays the number of guests who have stayed in each room" do
      visit "/rooms"

      within "##{@penthouse.suite}" do
        expect(page).to have_content("Number of Guests: 1")
      end

      within "##{@king.suite}" do
        expect(page).to have_content("Number of Guests: 3")
      end

      within "##{@double.suite}" do
        expect(page).to have_content("Number of Guests: 2")
      end
    end
  end
end