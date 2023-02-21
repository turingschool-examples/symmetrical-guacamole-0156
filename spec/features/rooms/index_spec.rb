require 'rails_helper'

RSpec.describe 'the rooms index page' do
  describe "as a visitor" do
    describe "when I visit the rooms index page" do
      it "it lists all rooms, their attributes, the name of the hotel they belong to and the number of guests staying in that room" do
        stanley = Hotel.create!(name: "The Stanley", location: "Estes Park")
        pres = Room.create!(suite: 'Presidential', rate: 400, hotel: stanley)
        king = Room.create!(suite: 'King', rate: 500, hotel: stanley)
        haunted = Room.create!(suite: 'Haunted', rate: 4, hotel: stanley)
        
        grand_budapest = Hotel.create!(name: "The Grand Budapest Hotel", location: "Budapest")
        poor = Room.create!(suite: 'Poor', rate: 50, hotel: grand_budapest)
        emperor = Room.create!(suite: 'Emperor', rate: 1000, hotel: grand_budapest)

        matt = Guest.create!(name: 'Matt', nights: 3)
        guestroom1 = GuestRoom.create!(guest: matt, room: pres )
        guestroom2 = GuestRoom.create!(guest: matt, room: king )

        stephanie = Guest.create!(name: 'Stephanie', nights: 2)
        guestroom3 = GuestRoom.create!(guest: stephanie, room: poor )
        guestroom4 = GuestRoom.create!(guest: stephanie, room: emperor )

        keith = Guest.create!(name: 'Keith', nights: 5)
        guestroom5 = GuestRoom.create!(guest: keith, room: pres )
        guestroom6 = GuestRoom.create!(guest: keith, room: king )
        guestroom8 = GuestRoom.create!(guest: keith, room: emperor )

        visit "/rooms/"
        save_and_open_page
        expect(page).to have_content("Suite: #{pres.suite}, Nightly Rate: #{pres.rate}, Hotel: #{pres.hotel.name}, Guest count: #{pres.guests.count_guests}")
        expect(page).to have_content("Suite: #{king.suite}, Nightly Rate: #{king.rate}, Hotel: #{king.hotel.name}, Guest count: #{king.guests.count_guests}")
        expect(page).to have_content("Suite: #{poor.suite}, Nightly Rate: #{poor.rate}, Hotel: #{poor.hotel.name}, Guest count: #{poor.guests.count_guests}")
        expect(page).to have_content("Suite: #{emperor.suite}, Nightly Rate: #{emperor.rate}, Hotel: #{emperor.hotel.name}, Guest count: #{emperor.guests.count_guests}")
        expect(page).to have_content("Suite: #{haunted.suite}, Nightly Rate: #{haunted.rate}, Hotel: #{haunted.hotel.name}, Guest count: #{haunted.guests.count_guests}")
      end
    end
  end
end