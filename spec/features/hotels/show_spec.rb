require 'rails_helper'

RSpec.describe "Hotel Show Page" do 
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

  describe 'When visiting the hotel show page' do 
    it 'has a unique list of all guests that stayed in this hotel' do 
      visit "/hotels/#{@hotel_1.id}"

      expect(page).to have_content(@hotel_1.name)
      expect(page).to_not have_content(@hotel_2.name)

      within(".hotel_guests") do 
        expect(page).to have_content("Kimberly Kimbers", count: 1)
        expect(page).to have_content("Timothy Timmons", count: 1)
        expect(page).to_not have_content("Nathan Nathaniels")
      end
    end

    it 'has infor for another hotel' do 
       visit "/hotels/#{@hotel_2.id}"

      expect(page).to have_content(@hotel_2.name)
      expect(page).to_not have_content(@hotel_1.name)

      within(".hotel_guests") do 
        expect(page).to have_content("Nathan Nathaniels", count: 1)
        expect(page).to_not have_content("Kimberly Kimbers", count: 1)
        expect(page).to_not have_content("Timothy Timmons", count: 1)
      end 
    end
  end
end