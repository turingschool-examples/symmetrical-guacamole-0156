require 'rails_helper'

RSpec.describe Hotel, type: :model do
  let!(:hotel1) {Hotel.create!(name: 'Echo Mountain Inn', location: "Echo Mountain")}
 
  let!(:room1) {Room.create!(rate: 125, suite: "Presidential", hotel_id: hotel1.id)}
  let!(:room2) {Room.create!(rate: 225, suite: "Honeymoon Suite", hotel_id: hotel1.id)}

  let!(:guest1) {Guest.create!(name: "Charlize Theron", nights: 3)}
  let!(:guest2) {Guest.create!(name: "Tim Allen", nights: 2)}

  before do
    RoomGuest.create!(room: room1, guest: guest1)
    RoomGuest.create!(room: room2, guest: guest1)
    RoomGuest.create!(room: room1, guest: guest2)
  end
  describe 'relationships' do
    it {should have_many :rooms}
  end

  describe 'instance methods' do
    it '#list_of_guests' do
      expect(hotel1.list_of_guests).to eq(["Tim Allen", "Charlize Theron"])
    end
  end
end