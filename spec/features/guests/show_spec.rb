require "rails_helper"

RSpec.describe "Guest Show Page" do
  describe 'As a visitor' do
    context "When I visit a guest's show page" do
      before(:each) do
        hotel = Hotel.create!(name: "The Hythe", location: "Vail, CO")

        @junior_suite = Room.create!(suite: "Junior", rate: 250, hotel: hotel)
        @penthouse = Room.create!(suite: "Penthouse", rate: 1000, hotel: hotel)
        @standard_room = Room.create!(suite: "Standard Room", rate: 125, hotel: hotel)

        @adam = Guest.create!(name: "Adam", nights: 2)
        @brie = Guest.create!(name: "Brie", nights: 5)

        RoomGuest.create!(guest: @adam, room: @junior_suite)
        RoomGuest.create!(guest: @adam, room: @standard_room)
        RoomGuest.create!(guest: @brie, room: @penthouse)

        visit "/guests/#{@adam.id}"
      end
      
      it "can see the guest's name" do
        expect(page).to have_content("Guest Name: Adam")
        expect(page).to_not have_content("Guest Name: Brie")
      end
      
      it "can see a list of all rooms the guest has stayed in, including their suite, rate and hotel name" do
        within("#room-#{@junior_suite.id}") {
          expect(page).to have_content("Hotel: The Hythe")
          expect(page).to have_content("Suite: Junior")
          expect(page).to have_content("Rate: 250")

          expect(page).to_not have_content("Suite: Standard Room")
          expect(page).to_not have_content("Rate: 125")
        }
      end

      it "can see a form to add new room, fill in the form with an existing id and submit to be redirected back to show page and see the new room" do
        within("#new_room") {
          expect(page).to have_field(:room_id)
          expect(page).to have_button("Submit")
          
          fill_in :room_id, with: @penthouse.id
          click_button "Submit"
        }

        expect(current_path).to eq("/guests/#{@adam.id}")

        within("#room-#{@penthouse.id}") {
          expect(page).to have_content("Hotel: The Hythe")
          expect(page).to have_content("Suite: Penthouse")
          expect(page).to have_content("Rate: 1000")
        }
      end
    end
  end
end