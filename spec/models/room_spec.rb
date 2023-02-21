require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it {should belong_to :hotel}
    it {should have_many :guest_rooms}
    it {should have_many(:guests).through(:guest_rooms)}
  end

  describe "instance methods" do
    let!(:mtn_1) {Hotel.create!(name: "Sun Valley Main", location: "North Slopes")}
    let!(:mtn_2) {Hotel.create!(name: "Sun Valley Private", location: "West Slopes")}
    let!(:tori) {Guest.create!(name: "Tori", nights_stayed: "7")}
    let!(:penthouse) {tori.rooms.create!(rate: 9998, suite: "Penthouse", hotel_id: mtn_1.id)}
    let!(:cabin) {tori.rooms.create!(rate: 8798, suite: "Private Cabin", hotel_id: mtn_2.id)}

    it 'can tell the hotel name of the room' do
      expect(cabin.hotel_name).to eq("Sun Valley Private")
    end
  end
end