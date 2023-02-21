require 'rails_helper'

RSpec.describe Room, type: :model do
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
  describe 'relationships' do
    it {should belong_to :hotel}
    it {should have_many :guest_rooms}
    it {should have_many :guests}
  end

  describe 'validations' do 
    it {should validate_presence_of :suite}
    it {should validate_numericality_of :rate}
  end

  describe '#guest_count' do 
    it 'is the number of guests that have stayed in the room' do 
      expect(@room_1.guest_count).to eq(2)
    end
  end
end