require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'relationships' do
    it {should have_many :rooms}
  end

  describe "class methods" do
    let!(:echo) { Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain") }
    let!(:king) { echo.rooms.create!(rate: 125, suite: "King Bed Room") }
    let!(:jimmy) { Guest.create!(name: "Jimmy", nights: 3) }
    let!(:naomi) { Guest.create!(name: "Naomi", nights: 2) }
    
    before do
      GuestRoom.create!(guest: jimmy, room: king)
      GuestRoom.create!(guest: naomi, room: king)
    end

    describe "#guest_names" do
      it "returns the total amount of guest that have stayed in that room" do

        expect(echo.guest_names).to eq(["Jimmy, Naomi"])

        alex = Guest.create!(name: "Alex", nights: 4)
        GuestRoom.create!(guest: alex, room: king)

        expect(echo.guest_names).to eq(["Jimmy, Naomi, Alex"])
      end
    end
  end
end