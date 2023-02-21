require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it {should belong_to :hotel}
  end

  describe '#hotel_name' do
    it 'can return the name of the hotel it belongs to' do
      @red_cliffs = Hotel.create!(name: "Red Cliffs Lodge", location: "Moab")
      @river_side = @red_cliffs.rooms.create!(rate: 250, suite: "River Side")

      expect(@river_side.hotel_name).to eq "Red Cliffs Lodge"
    end
  end

  describe '#guest_count' do 
    it 'returns a unique count of the total number of guests stayed in the room' do 
      @red_cliffs = Hotel.create!(name: "Red Cliffs Lodge", location: "Moab")
      @cabin = @red_cliffs.rooms.create!(rate: 125, suite: "Cabin")
      @guest_1 = Guest.create!(name: "Nik", nights: 5)
      @guest_2 = Guest.create!(name: "Matt", nights: 2)
      
      expect(@cabin.guest_count).to eq 0

      GuestRoom.create!(guest: @guest_2, room: @cabin)
      expect(@cabin.guest_count).to eq 1

      GuestRoom.create!(guest: @guest_1, room: @cabin)
      expect(@cabin.guest_count).to eq 2

      GuestRoom.create!(guest: @guest_1, room: @cabin)
      expect(@cabin.guest_count).to eq 2
    end
  end
end