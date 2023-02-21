require "rails_helper"

RSpec.describe "Hotel Show Page" do
  describe "As a visitor" do
    context "When I visit a hotel's show page" do
      before(:each) do
        @hotel = Hotel.create!(name: "The Hythe", location: "Vail, CO")

        @junior_suite = Room.create!(suite: "Junior", rate: 250, hotel: @hotel)
        @penthouse = Room.create!(suite: "Penthouse", rate: 1000, hotel: @hotel)
        @standard_room = Room.create!(suite: "Standard Room", rate: 125, hotel: @hotel)

        @adam = Guest.create!(name: "Adam", nights: 2)
        @brie = Guest.create!(name: "Brie", nights: 5)
        
        RoomGuest.create!(guest: @adam, room: @junior_suite)
        RoomGuest.create!(guest: @adam, room: @standard_room)
        RoomGuest.create!(guest: @brie, room: @penthouse)

        visit "/hotels/#{@hotel.id}"
      end

      it "can see a unique list of all guests that have stayed at this hotel" do
        within("#guests") {
          expect(page).to have_content("Adam")
          expect(page).to have_content("Brie")
          expect(page).to_not have_content("Josh")
        }

        josh = Guest.create!(name: "Josh", nights: 3)
        RoomGuest.create!(guest: josh, room: @standard_room)

        visit "/hotels/#{@hotel.id}"

        within("#guests") {
          expect(page).to have_content("Adam")
          expect(page).to have_content("Brie")
          expect(page).to have_content("Josh")
        }
      end
    end
  end
end