require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'relationships' do
    it { should have_many :rooms }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
  end

  describe '#instance methods' do
    describe '#unique_guests' do
      before(:each) do
        @hotel = Hotel.create!(name: "The Hythe", location: "Vail, CO")

        @junior_suite = Room.create!(suite: "Junior", rate: 250, hotel: @hotel)
        @penthouse = Room.create!(suite: "Penthouse", rate: 1000, hotel: @hotel)
        @standard_room = Room.create!(suite: "Standard Room", rate: 125, hotel: @hotel)

        @adam = Guest.create!(name: "Adam", nights: 2)
        @brie = Guest.create!(name: "Brie", nights: 5)
        
        RoomGuest.create!(guest: @adam, room: @junior_suite)
        RoomGuest.create!(guest: @adam, room: @standard_room)
        RoomGuest.create!(guest: @brie, room: @penthouse)
      end
      
      it 'returns a list of unique guest names' do
        expect(@hotel.unique_guests).to eq(["Adam", "Brie"])

        josh = Guest.create!(name: "Josh", nights: 3)
        RoomGuest.create!(guest: josh, room: @standard_room)

        expect(@hotel.unique_guests).to eq(["Adam", "Brie", "Josh"])
      end
    end
  end
end