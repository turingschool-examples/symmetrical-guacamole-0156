require 'rails_helper'

RSpec.describe '#show' do

  before(:each) do
    @red_cliffs = Hotel.create!(name: "Red Cliffs Lodge", location: "Moab")
    @guest_1 = Guest.create!(name: "Nik", nights: 5)
    @cabin = @red_cliffs.rooms.create!(rate: 125, suite: "Cabin")
    @river_side = @red_cliffs.rooms.create!(rate: 250, suite: "River Side")

    GuestRoom.create!(guest: @guest_1, room: @cabin)
    GuestRoom.create!(guest: @guest_1, room: @river_side)

  end

  describe 'as a user when i visit a guest show page' do
    describe 'i should see' do 
      it "the guest's name" do
        visit "/guests/#{@guest_1.id}"

        expect(page).to have_content "Guest: Nik"
      end

      it 'a list of all the rooms the guest has stayed in and their details' do 
        visit "/guests/#{@guest_1.id}"
  
        expect(page).to have_content "Rooms Stayed In\nCabin"
        expect(page).to have_content "Rate: 125\nHotel: Red Cliffs Lodge"
        expect(page).to have_content "River Side"
        expect(page).to have_content "Rate: 250\nHotel: Red Cliffs Lodge"

      end
    end
  end
end