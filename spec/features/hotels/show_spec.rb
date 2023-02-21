require 'rails_helper'

RSpec.describe "Show", type: :feature do
  describe "As a visitor" do
    before :each do 
      @echo = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
      @room1 = @echo.rooms.create!(rate: 125, suite: "Presidential")
      @room2 = @echo.rooms.create!(rate: 100, suite: "Standard King")
      @room3 = @echo.rooms.create!(rate: 250, suite: "Honeymoon")
      @mike = Guest.create!(name: 'Mike Smith', nights: 3)
      @matt = Guest.create!(name: 'Matt Smith', nights: 4)
      GuestRoom.create!(guest:@mike, room: @room1)
      GuestRoom.create!(guest:@mike, room: @room2)
      GuestRoom.create!(guest:@matt, room: @room2)
      GuestRoom.create!(guest:@matt, room: @room2)
      visit "/hotels/#{@echo.id}"
    end
    describe "When I visit a hotel's show page," do
      it "Then I see a unique list of all guests that have stayed at this hotel." do
        save_and_open_page
        expect(page).to have_content("Name: #{@echo.name}")
        expect(page).to have_content("Guests That Have Stayed Here By Room:")

        within "#room_info-#{@room1.id}" do
        expect(page).to have_content("Suite: #{@room1.suite}")
        expect(page).to have_content("Guest: #{@mike.name}")
        end
        within "#room_info-#{@room2.id}" do
        expect(page).to have_content("Suite: #{@room2.suite}")
        expect(page).to have_content("Guest: #{@mike.name}")
        expect(page).to have_content("Guest: #{@matt.name}")
        end
        expect(page).to have_content("Suite: #{@room3.suite}")
      end
    end
  end

end