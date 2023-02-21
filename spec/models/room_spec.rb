require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it {should belong_to :hotel}
    it {should have_many :guest_rooms}
    it {should have_many(:guests).through(:guest_rooms)}
  end

  it '#suite' do
    budapest = Hotel.create!(name: "Grand Budapest", location: 'Turkey')
    room1 = Room.create!(hotel_id: budapest.id, suite: "Presidential", rate: 125)
    expect(room1.suite).to eq("Presidential")
  end

  it '#rate' do
    budapest = Hotel.create!(name: "Grand Budapest", location: 'Turkey')
    room1 = Room.create!(hotel_id: budapest.id, suite: "Presidential", rate: 125)
    expect(room1.rate).to eq(125)
  end

  it '#hotel_name' do 
    budapest = Hotel.create!(name: "Grand Budapest", location: 'Turkey')
    room1 = Room.create!(hotel_id: budapest.id, suite: "Presidential", rate: 125)
    expect(room1.hotel_name).to eq(budapest.name)
  end

  it '#number_of_guests' do 
    budapest = Hotel.create!(name: "Grand Budapest", location: 'Turkey')
    room1 = Room.create!(hotel_id: budapest.id, suite: "Presidential", rate: 125)
    charlize = Guest.create!(name:"Charlize Theron", nights: 3)
    manny = Guest.create!(name:"Manny", nights: 2)
    guest_room1 = GuestRoom.create!(room_id: room1.id, guest_id: charlize.id)
    guest_room1 = GuestRoom.create!(room_id: room1.id, guest_id: manny.id)
    expect(room1.number_of_guests).to eq(2)
  end
end