require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it {should belong_to :hotel}
    it {should have_many :guest_rooms}
    it {should have_many(:guests).through(:guest_rooms)}
  end

  describe "instance methods" do 
    before(:each) do 
      @hotel_1 = Hotel.create!(name: "Losodeli", location: "Rinconada")
      @hotel_2 = Hotel.create!(name: "Casa Flow", location: "Zicatela")
    
      @room_san_jose = @hotel_1.rooms.create!(rate: 80, suite: "Presidential")
      @room_oaxaca = @hotel_1.rooms.create!(rate: 100, suite: "Twin")
      @room_jocotopec = @hotel_1.rooms.create!(rate: 50, suite: "Pauper")
      @room_da_flow = @hotel_2.rooms.create!(rate:300, suite: "Beachside")
    
      @guest_hady = Guest.create!(name: "Hady", nights: 12)
      @guest_malena = Guest.create!(name: "Malena", nights: 6)
      @guest_sebastian = Guest.create!(name: "Sebastian", nights: 8)
    
      GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_oaxaca.id)
      GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_jocotopec.id)
      GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_da_flow.id)
    
      GuestRoom.create!(guest_id: @guest_malena.id, room_id: @room_jocotopec.id)
      GuestRoom.create!(guest_id: @guest_malena.id, room_id: @room_da_flow.id)
    
      GuestRoom.create!(guest_id: @guest_sebastian.id, room_id: @room_da_flow.id)
      GuestRoom.create!(guest_id: @guest_sebastian.id, room_id: @room_san_jose.id)
    
    end 
    it "#count_guests" do 
      expect(@room_da_flow.count_guests).to eq(3)
    end
  end
end