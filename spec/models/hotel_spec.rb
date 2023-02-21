require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'relationships' do
    it {should have_many :rooms}
  end

  it '#name' do
    budapest = Hotel.create!(name: "Grand Budapest", location: 'Turkey')
    expect(budapest.name).to eq("Grand Budapest")
  end

  it '#location' do
    budapest = Hotel.create!(name: "Grand Budapest", location: 'Turkey')
    expect(budapest.location).to eq("Turkey")
  end

  it '#guests' do
    budapest = Hotel.create!(name: "Grand Budapest", location: 'Turkey')
    room1 = Room.create!(hotel_id: budapest.id, suite: "Presidential", rate: 125)
    charlize = Guest.create!(name:"Charlize Theron", nights: 3)
    danny = Guest.create!(name:"Danny", nights: 2)
    mark = Guest.create!(name:"Mark", nights: 3) 
    guest_room1 = GuestRoom.create!(room_id: room1.id, guest_id: charlize.id)
    guest_room2 = GuestRoom.create!(room_id: room1.id, guest_id: danny.id)
    guest_room3 = GuestRoom.create!(room_id: room1.id, guest_id: mark.id)
    expect(budapest.guests.sort).to eq([charlize, danny, mark].sort)
  end
end