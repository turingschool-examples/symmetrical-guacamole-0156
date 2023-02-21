require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it { should belong_to :hotel }
    it { should have_many :guest_rooms }
    it { should have_many(:guests).through(:guest_rooms) }
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
      GuestRoom.create!(guest: @jasmine, room: @king)
      GuestRoom.create!(guest: @ivan, room: @king)
      GuestRoom.create!(guest: @ivan, room: @double)
      GuestRoom.create!(guest: @ivan, room: @double)
      GuestRoom.create!(guest: @hailey, room: @king)
      GuestRoom.create!(guest: @hailey, room: @double)
    end

    describe '#number_of_guests' do
      it 'returns the number of unique guests for a room' do
        expect(@penthouse.number_of_guests).to eq(1)
        expect(@king.number_of_guests).to eq(3)
        expect(@double.number_of_guests).to eq(2)

        GuestRoom.create!(guest: @jasmine, room: @double)
        
        expect(@double.number_of_guests).to eq(3)
      end
    end
  end
end