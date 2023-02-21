require 'rails_helper'

RSpec.describe Room, type: :model do
  let!(:aspen) { Hotel.create!(name: "Tyrolean Inn", location: "Aspen") }
  let!(:bum) { aspen.rooms.create!(rate: 100, suite: "Ski Bum") }
  let!(:steve) { Guest.create!(name: "Steve", nights: 2) }
  let!(:steve) { Guest.create!(name: "Steve", nights: 2) }
  let!(:stevie) { Guest.create!(name: "Stevie", nights: 2) }

  before do
    GuestRoom.create!(guest: steve, room: bum)
    GuestRoom.create!(guest: steve, room: bum)
    GuestRoom.create!(guest: stevie, room: bum)
  end

  describe 'relationships' do
    it {should belong_to :hotel}
    it {should have_many(:guests).through(:guest_rooms)}
  end

  describe 'Instance Methods' do
    it '#guest_count' do
      expect(bum.guest_count).to eq(2)
      expect(bum.guest_count).not_to eq(3)
    end
  end
end