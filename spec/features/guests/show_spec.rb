require 'rails_helper'

RSpec.describe "Guest Show Page" do 
  before(:each) do 
    @guest_1 = Guest.create!(name: "Kimberly Kimbers", nights: 2)
    @guest_2 = Guest.create!(name: "Timothy Timmons", nights: 7)
    @guest_3 = Guest.create!(name: "Nathan Nathaniels", nights: 5)

    @hotel_1 = Hotel.create!(name: "Fancy Hotel", location: "Los Angeles") 
    @hotel_2 = Hotel.create!(name: "Subpar Hotel", location: "Denver")

    @room_1 = @hotel_1.rooms.create!(rate: 300, suite: "Standard")
    @room_2 = @hotel_1.rooms.create!(rate: 650, suite: "Penthouse")

    @room_3 = @hotel_2.rooms.create!(rate: 50, suite: "Standard")
    @room_4 = @hotel_2.rooms.create!(rate: 75, suite: "Presidential")

    @guest_rooms_1 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
    @guest_rooms_1 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_2.id)

    @guest_rooms_1 = GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_1.id)

    @guest_rooms_1 = GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_3.id)
    @guest_rooms_1 = GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_4.id)
  end

  describe 'When visiting a guest show page' do 
    it 'has the guests name and all the rooms they stayed in(suite, rate and hotel)' do 
      visit "/guests/#{@guest_1.id}"

      within(".guest_rooms_details") do 
        expect(page).to have_content(@room_1.name)
        expect(page).to have_content(@room_2.name)
        expect(page).to have_content(@hotel_1.name)
        expect(page).to_not have_content(@room_3.name)
        expect(page).to_not have_content(@room_4.rate)
      end
    end
  end
end