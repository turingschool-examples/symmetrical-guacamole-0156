require 'rails_helper'

RSpec.describe 'the guest show page' do
  describe "as a visitor" do
    describe "when I visit a guest's show page" do
      it "it lists all the rooms they've stayed in, cinluding the room's suite, nightly rate and name of the hotel it belongs to" do
        stanley = Hotel.create!(name: "The Stanley", location: "Estes Park")
        grand_budapest = Hotel.create!(name: "The Grand Budapest Hotel", location: "Budapest")
        pres = Room.create!(suite: 'Presidential', rate: 400, hotel: stanley)
        king = Room.create!(suite: 'King', rate: 500, hotel: stanley)
        poor = Room.create!(suite: 'Poor', rate: 50, hotel: grand_budapest)
        matt = Guest.create!(name: 'Matt', nights: 3)
        guestroom1 = GuestRoom.create!(guest: matt, room: pres )
        guestroom2 = GuestRoom.create!(guest: matt, room: king )

        visit "/guests/#{matt.id}"
        
        expect(page).to have_content("Suite: Presidential, Nightly Rate: 400, Hotel: The Stanley")
        expect(page).to have_content("Suite: King, Nightly Rate: 500, Hotel: The Stanley")
        expect(page).to_not have_content("The Grand Budapest Hotel")
        expect(page).to_not have_content("Poor")
      end

      it "it has a form to add a room to this guest. When I fill in the fields and click submit I am redirected back to this guest's show page and I see the room now listed under this guest" do
        stanley = Hotel.create!(name: "The Stanley", location: "Estes Park")
        grand_budapest = Hotel.create!(name: "The Grand Budapest Hotel", location: "Budapest")
        pres = Room.create!(suite: 'Presidential', rate: 400, hotel: stanley)
        king = Room.create!(suite: 'King', rate: 500, hotel: stanley)
        poor = Room.create!(suite: 'Poor', rate: 20, hotel: grand_budapest)
        matt = Guest.create!(name: 'Matt', nights: 3)
        guestroom1 = GuestRoom.create!(guest: matt, room: pres )
        guestroom2 = GuestRoom.create!(guest: matt, room: king )

        visit "/guests/#{matt.id}"

        expect(page).to_not have_content("The Grand Budapest Hotel")
        expect(page).to_not have_content("Poor")
        expect(page).to_not have_content("20")
  
        fill_in("Room ID", with: poor.id)
        click_button("Submit")
   
        expect(current_path).to eq("/guests/#{matt.id}")
        expect(page).to have_content("The Grand Budapest Hotel")
        expect(page).to have_content("Poor")
        expect(page).to have_content("20")
      end
    end
  end
end