require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it {should belong_to :hotel}
    it {should have_many :guest_rooms}
    it {should have_many(:guests).through(:guest_rooms)}
  end

  let(:hotel_1) { Hotel.create!(name: 'The Stanley', location: 'Estes Park, CO') }
  let(:hotel_2) { Hotel.create!(name: 'The Brown Palace', location: 'Denver, CO') }
  let(:room_1) { hotel_1.rooms.create!(rate: 50, suite: 'Suite 1') }
  let(:room_2) { hotel_2.rooms.create!(rate: 60, suite: 'Suite 2') }
  let(:room_3) { hotel_2.rooms.create!(rate: 60, suite: 'Suite 3') }
  let(:john) { Guest.create!(name: 'John Smith', nights: 2) }
  let(:jane) { Guest.create!(name: 'Jane Smith', nights: 3) }

  before do
    GuestRoom.create!(guest: john, room: room_1)
    GuestRoom.create!(guest: john, room: room_1)
    GuestRoom.create!(guest: jane, room: room_1)
    GuestRoom.create!(guest: john, room: room_2)
    GuestRoom.create!(guest: jane, room: room_3)
  end

  describe '.instance_methods' do

    it 'can give a count of unique guests who have stayed in each room' do
      expect(room_1.guest_count).to eq(2)
      expect(room_2.guest_count).to eq(1)
      expect(room_3.guest_count).to eq(1)

      james = Guest.create!(name: 'James Smith', nights: 2)
      GuestRoom.create!(guest: james, room: room_2)

      expect(room_2.guest_count).to eq(2)
      expect(room_2.guest_count).to_not eq(1)
    end
  end
end