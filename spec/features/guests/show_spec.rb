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
        save_and_open_page
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
    end
  end
end