require 'rails_helper'

RSpec.describe 'Hotels Index Page', type: :feature do

  let(:hotel_1) { Hotel.create!(name: 'The Stanley', location: 'Estes Park, CO') }
  let(:hotel_2) { Hotel.create!(name: 'The Brown Palace', location: 'Denver, CO') }
  let(:room_1) { hotel_1.rooms.create!(rate: 50, suite: 'Suite 1') }
  let(:room_2) { hotel_2.rooms.create!(rate: 60, suite: 'Suite 2') }
  let(:room_3) { hotel_2.rooms.create!(rate: 60, suite: 'Suite 3') }
  let(:john) { Guest.create!(name: 'John Smith', nights: 2) }
  let(:jane) { Guest.create!(name: 'Jane Smith', nights: 3) }
  let!(:james) { Guest.create!(name: 'James Smith', nights: 2) }

  before do
    GuestRoom.create!(guest: john, room: room_1)
    GuestRoom.create!(guest: jane, room: room_1)
    GuestRoom.create!(guest: john, room: room_2)
    GuestRoom.create!(guest: jane, room: room_2)
    GuestRoom.create!(guest: jane, room: room_3)
    GuestRoom.create!(guest: james, room: room_1)

    visit "/hotels/#{hotel_2.id}"
  end

  describe 'As a visitor' do
    describe 'when I visit the rooms index page' do
      it 'displays all of the unique guests that have stayed at this hotel' do
        expect(page).to have_content("The Brown Palace")
        
        expect(page).to have_content("All Guest Names: #{john.name}, #{jane.name}")
        expect(page).to have_content("All Guest Names: #{john.name}, #{jane.name}, #{james.name}")
      end
    end
  end
end