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
    let!(:suite) {tori.rooms.create!(rate: 998, suite: "Suite", hotel_id: mtn_1.id)}
    let!(:joseph) {penthouse.guests.create!(name: "Joseph", nights_stayed: "7")}

    it 'can tell the hotel name of the room' do
      expect(cabin.hotel_name).to eq("Sun Valley Private")
    end

    it 'can tell the number of guests that have stayed' do
      expect(penthouse.guests_stayed).to eq(2)
      expect(suite.guests_stayed).to eq(1)
      expect(cabin.guests_stayed).to eq(1)
    end
  end
end