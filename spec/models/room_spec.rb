require 'rails_helper'

RSpec.describe Room, type: :model do
  let!(:winterpark) { Hotel.create!(name: 'Winter Park Hotel', location: 'Winter Park') }
  let!(:andra) { Guest.create!(name: "Andra", nights: 4) }
  let!(:james) { Guest.create!(name: "James", nights: 2) }

  let!(:b27) { winterpark.rooms.create!(rate: 60, suite: "b27") }

  before do
    GuestRoom.create!(guest: james, room: b27)
    GuestRoom.create!(guest: andra, room: b27)
  end


  describe 'relationships' do
    it {should belong_to :hotel}
    it { should have_many(:guests).through(:guest_rooms) }
  end

  describe 'Instance Methods' do
    describe '#guest_count' do
      it 'totals the number of guests' do
        expect(b27.guest_count).to eq(2)
      end
    end
  end
end