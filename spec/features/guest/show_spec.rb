require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a guests show page' do
    let!(:mtn_1) {Hotel.create!(name: "Sun Valley Main", location: "North Slopes")}
    let!(:mtn_2) {Hotel.create!(name: "Sun Valley Private", location: "West Slopes")}
    let!(:tori) {Guest.create!(name: "Tori", nights_stayed: "7")}
    let!(:penthouse) {tori.rooms.create!(rate: 9998, suite: "Penthouse", hotel_id: mtn_1.id)}
    let!(:cabin) {tori.rooms.create!(rate: 8798, suite: "Private Cabin", hotel_id: mtn_2.id)}


    it 'I see the guests name' do
      visit "/guests/#{tori.id}"

      expect(page).to have_content("Hi, Tori. Here is your past stay information.")
    end

    it "And I see a list of all the rooms they've stayed in" do
      visit "/guests/#{tori.id}"

      expect(page).to have_content("Penthouse at the Icelandic Inn")
      expect(page).to have_content("Private Cabin at the Denali Denn")
    end

    it "including the room's suite, nightly rate, and the name of the hotel that it belongs to." do
      visit "/guests/#{tori.id}"

      within "#Penthouse Icelandic Inn" do
        expect(page).to have_content("Penthouse")
        expect(page).to have_content("9998")
        expect(page).to have_content("Icelandic Inn")
      end

      within "#Private Cabin Denali Denn" do
        expect(page).to have_content("Private Cabin")
        expect(page).to have_content("8798")
        expect(page).to have_content("Denali Denn")
      end
    end
  end
end