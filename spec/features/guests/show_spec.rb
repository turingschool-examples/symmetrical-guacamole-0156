require 'rails_helper'

RSpec.describe 'Guest Show page' do

  before do 
    @hotel_1 = Hotel.create!(name: 'Stanly Hotel', location: 'Estes Park')
    @room_401 = @hotel_1.rooms.create!(rate: 50, suite: 'Executive Suite')
    @guest_1 = Guest.create!(name: 'jeff', nights: 1)
    GuestRoom.create(guest: @guest_1, room: @room_401)
  end
  describe 'As a user' do
    describe '/guests/:id' do
      it 'I see the guests name ' do
        visit "/guests/#{@guest_1.id}"

        expect(page).to have_content("Jeff's page")
      end 
    end
  end
end