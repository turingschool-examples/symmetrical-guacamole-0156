require "rails_helper"

RSpec.describe "Rooms Index Page" do
  describe 'As a visitor' do
    context "When i visit the rooms index page" do
      before(:each) do
        hythe = Hotel.create!(name: "The Hythe", location: "Vail, CO")
        ritz = Hotel.create!(name: "Ritz Carlton", location: "Beaver Creek, CO")

        @junior_suite = Room.create!(suite: "Junior", rate: 250, hotel: ritz)
        @penthouse = Room.create!(suite: "Penthouse", rate: 1000, hotel: hythe)
        @standard_room = Room.create!(suite: "Standard Room", rate: 125, hotel: hythe)

        @adam = Guest.create!(name: "Adam", nights: 2)
        @brie = Guest.create!(name: "Brie", nights: 5)

        RoomGuest.create!(guest: @adam, room: @junior_suite)
        RoomGuest.create!(guest: @adam, room: @standard_room)
        RoomGuest.create!(guest: @brie, room: @penthouse)
        RoomGuest.create!(guest: @brie, room: @junior_suite)

        visit "/rooms"
      end

      it 'can see a list of all rooms including the suite, rate, hotel name, and number of guests that stayed in it' do
        within("#room-#{@junior_suite.id}") {
          expect(page).to have_content("Suite: Junior")
          expect(page).to have_content("Rate: 250")
          expect(page).to have_content("Hotel: Ritz Carlton")
          expect(page).to have_content("Number of Guests Stayed: 2")
        }

        within("#room-#{@penthouse.id}") {
          expect(page).to have_content("Suite: Penthouse")
          expect(page).to have_content("Rate: 1000")
          expect(page).to have_content("Hotel: The Hythe")
          expect(page).to have_content("Number of Guests Stayed: 1")
        }

        within("#room-#{@standard_room.id}") {
          expect(page).to have_content("Suite: Standard Room")
          expect(page).to have_content("Rate: 125")
          expect(page).to have_content("Hotel: The Hythe")
          expect(page).to have_content("Number of Guests Stayed: 1")
        }
      end
    end
  end
end