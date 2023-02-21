require 'rails_helper'

RSpec.describe 'Guest Show page' do

  before do 
    @hotel_1 = Hotel.create!(name: 'Stanly Hotel', location: 'Estes Park')
    @room_401 = @hotel_1.rooms.create!(rate: 50, suite: 'Room 401')
    @room_402 = @hotel_1.rooms.create!(rate: 50, suite: 'Room 402')
    @guest_1 = Guest.create!(name: 'Jeff', nights: 1)
    GuestRoom.create(guest: @guest_1, room: @room_401)
  end
  describe 'As a user' do
    describe '/guests/:id' do
      it 'I see the guests name ' do
        visit "/guests/#{@guest_1.id}"

        expect(page).to have_content("Jeff's page")
      end 

      it 'And I see a list of all the rooms they have stayed in as well as room fields and hotel' do
        visit "/guests/#{@guest_1.id}"

        expect(page).to have_content("Rooms stayed in")
        expect(page).to have_content("Rooms: Room 401")
        expect(page).to have_content("Rate: 50")
        expect(page).to have_content("Hotel: Stanly Hotel")
      end

      it 'Then I see a form to add a room to this guest' do 
        visit "/guests/#{@guest_1.id}"

        expect(page).to have_field(:room_id)
        expect(page).to have_content("Add Room")
      end
    end
  end
end