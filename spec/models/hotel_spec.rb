require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'relationships' do
    it { should have_many :rooms }
    it { should have_many(:guests).through(:rooms) }
  end

  describe 'instance methods' do
    before(:each) do
      @hilton = Hotel.create!(name: "Hilton", location: "Hawaii")
      @double_tree = Hotel.create!(name: "DoubleTree", location: "Los Angeles")
      
      @jasmine = Guest.create!(name: "Jasmine", nights: 2)
      @ivan = Guest.create!(name: "Ivan", nights: 2)
      @hailey = Guest.create!(name: "Hailey", nights: 1)
  
      @penthouse = @hilton.rooms.create!(rate: 350, suite: "Penthouse")
      @king = @hilton.rooms.create!(rate: 175, suite: "King")
      @double = @double_tree.rooms.create!(rate: 190, suite: "Double")
  
      GuestRoom.create!(guest: @jasmine, room: @penthouse)
      GuestRoom.create!(guest: @jasmine, room: @king)
      GuestRoom.create!(guest: @ivan, room: @king)
      GuestRoom.create!(guest: @ivan, room: @double)
      GuestRoom.create!(guest: @hailey, room: @king)
      GuestRoom.create!(guest: @hailey, room: @double)
    end

    describe '#list_unique_guests' do
      it 'returns a unique list of guests for a hotel' do
        expect(@hilton.list_unique_guests).to eq([@jasmine, @ivan, @hailey])
        expect(@double_tree.list_unique_guests).to eq([@ivan, @hailey])

        GuestRoom.create!(guest: @jasmine, room: @double)

        expect(@double_tree.list_unique_guests).to eq([@jasmine, @ivan, @hailey])
      end
    end
  end
end