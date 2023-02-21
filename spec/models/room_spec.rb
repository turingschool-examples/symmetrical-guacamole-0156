require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it {should belong_to :hotel}
    it { should have_many(:guest_rooms) }
    it { should have_many(:guests).through(:guest_rooms) }

    describe "instance methods" do
      before :each do 
        @echo = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
        @room1 = @echo.rooms.create!(rate: 125, suite: "Presidential")
        @room2 = @echo.rooms.create!(rate: 100, suite: "Standard King")
        @mike = Guest.create!(name: 'Mike Smith', nights: 3)
        @matt = Guest.create!(name: 'Matt Smith', nights: 2)
        GuestRoom.create!(guest:@mike, room: @room1)
        GuestRoom.create!(guest:@mike, room: @room2)
        GuestRoom.create!(guest:@matt, room: @room1)
        GuestRoom.create!(guest:@matt, room: @room2)
        GuestRoom.create!(guest:@mike, room: @room2)
        GuestRoom.create!(guest:@mike, room: @room1)
      end
      it 'hotel_name' do
        expect(@room1.hotel_name).to eq(@echo.name)
      end

      it '#guest_count' do
        expect(@room1.guest_count).to eq(3)
        expect(@room1.guest_count).to_not eq(6)
        expect(@room1.guest_count).to eq(3)
        expect(@room1.guest_count).to_not eq(nil)
      end
    end
  end
end