require 'rails_helper'

RSpec.describe 'Index', type: :feature do
  let!(:winterpark) { Hotel.create!(name: 'Winter Park Hotel', location: 'Winter Park') }

  let!(:b27) { winterpark.rooms.create!(rate: 60, suite: "b27") }
  let!(:e42) { winterpark.rooms.create!(rate: 80, suite: "e42") }

  let!(:andra) { Guest.create!(name: "Andra", nights: 4) }
  let!(:james) { Guest.create!(name: "James", nights: 2) }
  let!(:pedro) { Guest.create!(name: "Pedro", nights: 6) }


  before do
    GuestRoom.create!(guest: andra, room: b27)
    GuestRoom.create!(guest: james, room: b27)
    GuestRoom.create!(guest: pedro, room: e42)

    visit "/rooms"
  end

  describe 'when I visit /rooms' do
    describe 'Story 3' do
      it 'see list of all rooms w/ suite, nightly rate, name of hotel, & number of guests' do
        expect(page).to have_content('Hotel: Winter Park Hotel')
        expect(page).to have_content('Suite: b27')
        expect(page).to have_content('Rate: 60')
        expect(page).to have_content('Guest Count: 2')

        expect(page).to have_content('Hotel: Winter Park Hotel')
        expect(page).to have_content('Suite: e42')
        expect(page).to have_content('Rate: 80')
        expect(page).to have_content('Guest Count: 1')
      end
    end
  end
end