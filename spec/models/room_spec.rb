require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it { should belong_to :hotel }

    it { should have_many :room_guests }
    it { should have_many :guests }
  end

  describe 'validations' do
    it { should validate_presence_of :suite }
    it { should validate_presence_of :rate }
    it { should validate_numericality_of :rate }
  end

  describe '::Class Methods' do
    describe '::total_guests' do
      it "returns the total number of guests stayed in room" do
        hythe = Hotel.create!(name: "The Hythe", location: "Vail, CO")
        junior_suite = Room.create!(suite: "Junior", rate: 250, hotel: hythe)
        adam = Guest.create!(name: "Adam", nights: 2)
        brie = Guest.create!(name: "Brie", nights: 5)

        RoomGuest.create!(guest: adam, room: junior_suite)
  
        expect(junior_suite.total_guests).to eq(1)

        RoomGuest.create!(guest: brie, room: junior_suite)

        expect(junior_suite.total_guests).to eq(2)
      end
    end
  end
end