require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a guests show page' do
    let!(:mtn_1) {Hotel.create!(name: "Sun Valley Main", location: "North Slopes")}
    let!(:mtn_2) {Hotel.create!(name: "Sun Valley Private", location: "West Slopes")}
    let!(:tori) {Guest.create!(name: "Tori", nights_stayed: "7")}
    let!(:penthouse) {tori.rooms.create!(rate: 9998, suite: "Penthouse", hotel_id: mtn_1.id)}
    let!(:cabin) {tori.rooms.create!(rate: 8798, suite: "Private Cabin", hotel_id: mtn_2.id)}
    let!(:suite) {tori.rooms.create!(rate: 998, suite: "Suite", hotel_id: mtn_1.id)}

    it 'I see the guests name' do
      visit "/guests/#{tori.id}"

      expect(page).to have_content("Hi, Tori. Here is your past stay information.")
    end

    it "And I see a list of all the rooms they've stayed in" do
      visit "/guests/#{tori.id}"

      expect(page).to have_content("Penthouse at the Sun Valley Main")
      expect(page).to have_content("Private Cabin at the Sun Valley Private")
    end

    it "including the room's suite, nightly rate, and the name of the hotel that it belongs to." do
      visit "/guests/#{tori.id}"

      expect(page).to have_content("Penthouse")
      expect(page).to have_content("9998")
      expect(page).to have_content("Sun Valley Main")
  
      expect(page).to have_content("Private Cabin")
      expect(page).to have_content("8798")
      expect(page).to have_content("Sun Valley Private")
    end

    describe 'add room' do
      it 'I see a form to add a room to this guest.' do
        visit "/guests/#{tori.id}"

        expect(page).to have_field("add_room")
        expect(page).to have_button("Submit")
      end

      describe 'When I fill in a field with the id of an existing room and click submit' do
        it 'I am redirected back to the guest show page' do
          visit "/guests/#{tori.id}"

          within "#add_stay" do
            fill_in 'add_room', with: "#{suite.id}"
            click_on 'Submit'

           expect(page.current_path).to eq("/guests/#{tori.id}")
          end
        end

        it "I see the room now listed under this guest's rooms" do
          visit "/guests/#{tori.id}"

          fill_in 'add_room', with: "#{suite.id}"
          click_on 'Submit'

          expect(page).to have_content("Suite at the Sun Valley Main")
          expect(page).to have_content("Suite")
          expect(page).to have_content("998")
          expect(page).to have_content("Sun Valley Main")
        end
      end
    end
    
  end
end