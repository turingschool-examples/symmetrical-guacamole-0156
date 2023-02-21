require 'rails_helper'

RSpec.describe "Show", type: :feature do
  describe "As a visitor" do
    before :each do 
      @echo = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
      @room1 = @echo.rooms.create!(rate: 125, suite: "Presidential")
      @room2 = @echo.rooms.create!(rate: 100, suite: "Standard King")
      @mike = Guest.create!(name: 'Mike Smith', nights: 3)
      GuestRoom.create!(guest:@mike, room: @room1)
      GuestRoom.create!(guest:@mike, room: @room2)
    end
    describe "when I visit a guests show page" do
      it "I see the guest's name and I see a list of all the rooms they've stayed in including the room's suite, nightly rate, and the name of the hotel that it belongs to." do
        visit "/guests/#{@mike.id}"

        expect(page).to have_content("Name: Mike Smith")
        expect(page).to have_content("Room Name: Presidential")
        expect(page).to have_content("Rate: 125")
        expect(page).to have_content("Hotel: Echo Mountain Inn")
        expect(page).to have_content("Room Name: Standard King")
        expect(page).to have_content("Rate: 100")
        expect(page).to have_content("Hotel: Echo Mountain Inn")
      end
    end
  end
end