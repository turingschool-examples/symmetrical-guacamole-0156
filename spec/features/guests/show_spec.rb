require 'rails_helper'

RSpec.describe "Guest Show Page" do 
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

  describe 'When visiting a guest show page' do 
    it 'has the guests name and all the rooms they stayed in(suite, rate and hotel)' do 
      visit "/guests/#{@guest_1.id}"
      
      expect(page).to have_content("Kimberly Kimbers")
      expect(page).to_not have_content(@guest_2.name)

      within("##{@room_1.id}") do 
        expect(page).to have_content(@room_1.suite)
        expect(page).to have_content(@room_1.rate)
        expect(page).to have_content(@hotel_1.name)
        expect(page).to_not have_content(@room_4.rate)
      end

      within("##{@room_2.id}") do 
        expect(page).to have_content(@room_2.suite)
        expect(page).to have_content(@room_2.rate)
        expect(page).to have_content(@hotel_1.name)
        expect(page).to_not have_content(@room_4.rate)
      end
    end

    it 'has a form to add an existing room to this guest and adds it to their show page' do 
      visit "/guests/#{@guest_1.id}" 

      within(".guest_rooms") do 
        expect(page).to_not have_content(@room_5.suite)
      end

      within(".add_room_form") do 
        fill_in("Room ID", with: @room_5.id)
        click_button("Submit")

        expect(current_path).to eq(visit "/guests/#{@guest_1.id}")
      end

      within(".guest_rooms") do 
        expect(page).to have_content(@room_5.suite)
      end
    end
  end
end