require 'rails_helper'

RSpec.describe "Guest Show Page", type: :feature do

  before do
    @hotel_1 = Hotel.create(name: "La Quinta", location: "Denver")

    @executive = @hotel_1.rooms.create!(rate: 400, suite: "Executive")
    @terrace = @hotel_1.rooms.create!(rate: 500, suite: "Terrace")

    @antonio = Guest.create!(name: "Antonio", nights: 12)
  end
  
  describe 'As a visitor,' do
    context "When I visit a guest's show page," do
      it "I see the guest's name," do
        visit "/guests/#{@antonio.id}"

        expect(page).to have_content("#{@antonio.name}'s Stay")
      end

      it "And I see a list of all the rooms they've stayed in including the room's suite, nightly rate, and the name of the hotel that it belongs to" do
        GuestRoom.create!(room_id: @executive.id, guest_id: @antonio.id)
        GuestRoom.create!(room_id: @terrace.id, guest_id: @antonio.id)
        
        visit "/guests/#{@antonio.id}"

        expect(page).to have_content("Hotel: La Quinta")
        expect(page).to have_content("Suite: Executive")
        expect(page).to have_content("Nightly Rate: $400")
        expect(page).to have_content("Hotel: La Quinta")
        expect(page).to have_content("Suite: Terrace")
        expect(page).to have_content("Nightly Rate: $500")
      end

      it "Then I see a form to add a room to this guest" do
        visit "/guests/#{@antonio.id}"
        save_and_open_page

          fill_in "room_id", with: "#{@executive.id}"
          click_button "Submit"
          
        within("#{@executive.id}") do
          expect(page).to have_content("Hotel: La Quinta")
          expect(page).to have_content("Suite: Executive")
          expect(page).to have_content("Nightly Rate: $400")
        end
      end
    end
  end
end