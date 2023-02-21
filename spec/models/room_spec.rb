require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it {should belong_to :hotel}
    it { should have_many(:guest_rooms) }
    it { should have_many(:guests).through(:guest_rooms) }

    describe "instance methods" do
      it 'gives the hotel name' do
        @echo = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
        @room1 = @echo.rooms.create!(rate: 125, suite: "Presidential")
        @room2 = @echo.rooms.create!(rate: 100, suite: "Standard King")
        expect(@room1.hotel_name).to eq(@echo.name)
      end
    end
  end
end