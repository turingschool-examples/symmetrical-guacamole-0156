require 'rails_helper'

RSpec.describe 'Guest Show Page', type: :feature do

  let(:hotel_1) { Hotel.create!(name: 'The Stanley', location: 'Estes Park') }
  let(:room_1) { hotel_1.rooms.create!(rate: 50, suite: 'Suite 1') }
  let(:room_2) { hotel_1.rooms.create!(rate: 60, suite: 'Suite 2') }
  let(:john) { Guest.create!(name: 'John Smith', nights: 2) }

  before do
    GuestRoom.create!(guest: john, room: room_1)
    GuestRoom.create!(guest: john, room: room_2)

    visit "/guests/#{john.id}"
  end

  describe 'As a visitor' do
    describe 'when I visit the guest show page' do
      it 'I see the guests name, the rooms they have stayed in and their attributes, and the name of the hotel the room belongs to' do
        expect(page).to have_content("Guest Name: #{john.name}")
        expect(page).to have_content("Rooms:")
        save_and_open_page
        within 'ul#room_info' do
          expect(page).to have_content("#{room_1.suite}, $#{room_1.rate}.00, #{hotel_1.name}")
          expect(page).to have_content("#{room_2.suite}, $#{room_2.rate}.00, #{hotel_1.name}")
        end
      end
    end
  end
end