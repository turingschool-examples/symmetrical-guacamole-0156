require 'rails_helper'

RSpec.describe 'Rooms Index Page', type: :feature do

  let(:hotel_1) { Hotel.create!(name: 'The Stanley', location: 'Estes Park, CO') }
  let(:hotel_2) { Hotel.create!(name: 'The Brown Palace', location: 'Denver, CO') }
  let(:room_1) { hotel_1.rooms.create!(rate: 50, suite: 'Suite 1') }
  let(:room_2) { hotel_2.rooms.create!(rate: 60, suite: 'Suite 2') }
  let(:room_3) { hotel_2.rooms.create!(rate: 60, suite: 'Suite 3') }
  let(:john) { Guest.create!(name: 'John Smith', nights: 2) }
  let(:jane) { Guest.create!(name: 'Jane Smith', nights: 3) }

  before do
    GuestRoom.create!(guest: john, room: room_1)
    GuestRoom.create!(guest: john, room: room_1)
    GuestRoom.create!(guest: jane, room: room_1)
    GuestRoom.create!(guest: john, room: room_2)
    GuestRoom.create!(guest: jane, room: room_3)

    visit '/rooms'
  end

  describe 'As a visitor' do
    describe 'when I visit the rooms index page' do
      it 'I see the rooms and their attributes listed' do
        expect(page).to have_content("All Rooms:")

        within 'ul#room_info' do
          save_and_open_page
          expect(page).to have_content("#{room_1.suite}: $#{room_1.rate}.00, #{hotel_1.name}, Number of Guests: 2")
          expect(page).to have_content("#{room_2.suite}: $#{room_2.rate}.00, #{hotel_2.name}, Number of Guests: 1")
          expect(page).to have_content("#{room_3.suite}: $#{room_3.rate}.00, #{hotel_2.name}, Number of Guests: 1")
        end
      end
    end
  end
end