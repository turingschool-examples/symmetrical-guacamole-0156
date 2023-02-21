require 'rails_helper'

RSpec.describe "Rooms Index Page" do
  before(:each) do 
    @guest_1 = Guest.create!(name: "Kimberly Kimbers", nights: 2)
    @guest_2 = Guest.create!(name: "Timothy Timmons", nights: 7)
    @guest_3 = Guest.create!(name: "Nathan Nathaniels", nights: 5)

    @hotel_1 = Hotel.create!(name: "Fancy Hotel", location: "Los Angeles") 
    @hotel_2 = Hotel.create!(name: "Subpar Hotel", location: "Denver")

    @room_1 = @hotel_1.rooms.create!(rate: 300, suite: "Standard")
    @room_2 = @hotel_1.rooms.create!(rate: 450, suite: "Penthouse")
    @room_5 = @hotel_1.rooms.create!(rate: 500, suite: "Presidential")

    @room_3 = @hotel_2.rooms.create!(rate: 50, suite: "Standard")
    @room_4 = @hotel_2.rooms.create!(rate: 75, suite: "Presidential")

    @guest_rooms_1 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
    @guest_rooms_1 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_2.id)

    @guest_rooms_1 = GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_1.id)

    @guest_rooms_1 = GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_3.id)
    @guest_rooms_1 = GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_4.id)
  end

  describe 'When visiting the rooms index page' do
    it 'has a list of all the rooms including (suite, rate, name of hotel, number of guests)' do 
      visit "/rooms"

      within("##{@room_1.id}") do 
        expect(page).to have_content(@room_1.suite)
        expect(page).to have_content("Rate: 300")
        expect(page).to have_content("Number of Guests: 2")
        expect(page).to have_content(@hotel_1.name)
        expect(page).to_not have_content("Rate: 400")
        expect(page).to_not have_content("rate: 500")
      end

      within("##{@room_3.id}") do 
        expect(page).to have_content(@room_3.suite)
        expect(page).to have_content("Rate: 50")
        expect(page).to have_content("Number of Guests: 1")
        expect(page).to have_content(@hotel_2.name)
        expect(page).to_not have_content("Rate: 400")
        expect(page).to_not have_content("rate: 500")
      end
    end
  end
end