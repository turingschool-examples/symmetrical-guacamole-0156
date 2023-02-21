require 'rails_helper'

RSpec.describe 'the hotel show page' do
  describe "as a visitor" do
    describe "when I visit a hotel's show page" do
      it "I see a unique list of all guests that have stayed at this hotel" do
        stanley = Hotel.create!(name: "The Stanley", location: "Estes Park")
        pres = Room.create!(suite: 'Presidential', rate: 400, hotel: stanley)
        king = Room.create!(suite: 'King', rate: 500, hotel: stanley)
        haunted = Room.create!(suite: 'Haunted', rate: 4, hotel: stanley)

        matt = Guest.create!(name: 'Matt', nights: 3)
        guestroom1 = GuestRoom.create!(guest: matt, room: pres )
        guestroom2 = GuestRoom.create!(guest: matt, room: king )

        stephanie = Guest.create!(name: 'Stephanie', nights: 2)
        guestroom3 = GuestRoom.create!(guest: stephanie, room: pres )
        guestroom4 = GuestRoom.create!(guest: stephanie, room: king )

        keith = Guest.create!(name: 'Keith', nights: 5)
        guestroom5 = GuestRoom.create!(guest: keith, room: king )
        guestroom6 = GuestRoom.create!(guest: keith, room: haunted)

        jomah = Guest.create!(name: 'Jomah', nights: 5)
        guestroom7 = GuestRoom.create!(guest: jomah, room: pres )
        guestroom8 = GuestRoom.create!(guest: jomah, room: haunted)
        
        visit "/hotels/#{stanley.id}"
    
        expect(page).to have_content("Matt Stephanie Keith Jomah")
      end
    end
  end
end
