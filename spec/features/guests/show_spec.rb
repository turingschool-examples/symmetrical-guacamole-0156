require 'rails_helper'

RSpec.describe "Show", type: :feature do
  describe "As a visitor" do
    before :each do 
      @echo = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
      @room1 = @echo.rooms.create!(rate: 125, suite: "Presidential")
      @room2 = @echo.rooms.create!(rate: 100, suite: "Standard King")
      @room3 = @echo.rooms.create!(rate: 250, suite: "Honeymoon")
      @mike = Guest.create!(name: 'Mike Smith', nights: 3)
      GuestRoom.create!(guest:@mike, room: @room1)
      GuestRoom.create!(guest:@mike, room: @room2)
      visit "/guests/#{@mike.id}"
    end
    describe "when I visit a guests show page" do
      it "I see the guest's name and I see a list of all the rooms they've stayed in including the room's suite, nightly rate, and the name of the hotel that it belongs to." do

        expect(page).to have_content("Name: Mike Smith")
        expect(page).to have_content("Room Name: Presidential")
        expect(page).to have_content("Rate: 125")
        expect(page).to have_content("Hotel: Echo Mountain Inn")
        expect(page).to have_content("Room Name: Standard King")
        expect(page).to have_content("Rate: 100")
        expect(page).to have_content("Hotel: Echo Mountain Inn")
      end

      it 'I see a form to add a room to this guest' do
        expect(page).to have_field(:room_id)
        expect(page).to have_button("Submit")
      end

      it "When I fill in a field with the id of an existing room And I click submit. Then I am redirected back to the guest's show page. And I see the room now listed under this guest's rooms." do
        expect(page).to_not have_content("Room Name: Honeymoon")
        expect(page).to_not have_content("Rate: 250")
        
        fill_in :room_id, with: "#{@room3.id}"
        click_on "Submit"

        expect(current_path).to eq("/guests/#{@mike.id}")
        expect(page).to have_content("Room Name: Honeymoon")
        expect(page).to have_content("Rate: 250")
      end
    end
  end
end