require 'rails_helper'

describe 'Rooms index page' do
  describe 'As a visitor' do
    describe 'When I visit the rooms index page' do
      let!(:mtn_1) {Hotel.create!(name: "Sun Valley Main", location: "North Slopes")}
      let!(:mtn_2) {Hotel.create!(name: "Sun Valley Private", location: "West Slopes")}
      let!(:tori) {Guest.create!(name: "Tori", nights_stayed: "7")}
      let!(:penthouse) {tori.rooms.create!(rate: 9998, suite: "Penthouse", hotel_id: mtn_1.id)}
      let!(:cabin) {tori.rooms.create!(rate: 8798, suite: "Private Cabin", hotel_id: mtn_2.id)}
      let!(:suite) {tori.rooms.create!(rate: 998, suite: "Suite", hotel_id: mtn_1.id)}
      let!(:joseph) {penthouse.guests.create!(name: "Joseph", nights_stayed: "7")}
      let!(:mansion) {joseph.rooms.create!(rate: 89776, suite: "Private Mansion", hotel_id: mtn_2.id)}
  
      it 'Then I see a list of all rooms' do
        visit '/rooms'

        expect(page).to have_content(penthouse.suite)
        expect(page).to have_content(cabin.suite)
        expect(page).to have_content(suite.suite)
        expect(page).to have_content(mansion.suite)

      end

      it "including the room's suite, nightly rate, and the name of the hotel that it belongs to" do
        visit '/rooms'

        within "##{penthouse.id}" do
          expect(page).to have_content(penthouse.rate)
          expect(page).to have_content(penthouse.hotel_name)
        end

        within "##{cabin.id}" do
          expect(page).to have_content(cabin.rate)
          expect(page).to have_content(cabin.hotel_name)
        end

        within "##{suite.id}" do
          expect(page).to have_content(suite.rate)
          expect(page).to have_content(suite.hotel_name)
        end

        within "##{mansion.id}" do
          expect(page).to have_content(mansion.rate)
          expect(page).to have_content(mansion.hotel_name)
        end
      end

      it "and the number of guests that have stayed in that room." do
        visit '/rooms'
        
        within "##{penthouse.id}" do
          expect(page).to have_content("Previous Guest Count: 2")
        end

        within "##{cabin.id}" do
          expect(page).to have_content("Previous Guest Count: 1")
        end

        within "##{suite.id}" do
          expect(page).to have_content("Previous Guest Count: 1")
        end

        within "##{mansion.id}" do
          expect(page).to have_content("Previous Guest Count: 1")
        end

      end
    end
  end
end