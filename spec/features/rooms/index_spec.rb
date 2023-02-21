require 'rails_helper'

RSpec.describe "Index", type: :feature do 
  describe "As a visitor" do
    before :each do
      @echo = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
      #@dt = Hotel.create!(name: 'Double Tree', location: 'Loveland')
      @room1 = @echo.rooms.create!(rate: 125, suite: "Presidential")
      @room2 = @echo.rooms.create!(rate: 100, suite: "Standard King")
      @room3 = @echo.rooms.create!(rate: 250, suite: "Honeymoon")
      # @room4 = @dt.rooms.create!(rate: 125, suite: "Presidential")
      # @room5 = @dt.rooms.create!(rate: 100, suite: "Standard King")
      # @room6 = @dt.rooms.create!(rate: 250, suite: "Honeymoon")
      @mike = Guest.create!(name: 'Mike Smith', nights: 3)
      @matt = Guest.create!(name: 'Matt Smith', nights: 2)
      GuestRoom.create!(guest:@mike, room: @room1)
      GuestRoom.create!(guest:@mike, room: @room2)
      GuestRoom.create!(guest:@matt, room: @room1)
      GuestRoom.create!(guest:@matt, room: @room2)
      GuestRoom.create!(guest:@mike, room: @room2)
      GuestRoom.create!(guest:@mike, room: @room1)
    end
    describe "When I visit the rooms index page" do
      it "Then I see a list of all rooms including the room's suite, nightly rate, and the name of the hotel that it belongs to and the number of guests that have stayed in that room." do
        visit '/rooms'
        
        expect(page).to have_content("Room Suite: #{@room1.suite}")
        expect(page).to have_content("Nightly Rate: #{@room1.rate}")
        expect(page).to have_content("Hotel: #{@room1.hotel.name}")
        expect(page).to have_content("# of Guests That Have Stayed in Room: #{@room1.guest_count}")
        expect(page).to have_content("Room Suite: #{@room2.suite}")
        expect(page).to have_content("Nightly Rate: #{@room2.rate}")
        expect(page).to have_content("Hotel: #{@room2.hotel.name}")
        expect(page).to have_content("# of Guests That Have Stayed in Room: #{@room2.guest_count}")
        expect(page).to have_content("Room Suite: #{@room3.suite}")
        expect(page).to have_content("Nightly Rate: #{@room3.rate}")
        expect(page).to have_content("Hotel: #{@room3.hotel.name}")
        expect(page).to have_content("# of Guests That Have Stayed in Room: #{@room3.guest_count}")
      end
    end
  end
end