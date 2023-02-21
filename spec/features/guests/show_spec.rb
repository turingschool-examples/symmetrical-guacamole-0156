require 'rails_helper'

RSpec.describe 'Show', type: :feature do
  
  let!(:echo) { Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain') }
  let!(:winterpark) { Hotel.create!(name: 'Winter Park Hotel', location: 'Winter Park') }

  let!(:andra) { Guest.create!(name: "Andra", nights: 4) }

  let!(:presedential) { echo.rooms.create!(rate: 125, suite: "Presedential") }
  let!(:b27) { winterpark.rooms.create!(rate: 60, suite: "b27") }

  before do
    GuestRoom.create!(guest: andra, room: presedential)
    GuestRoom.create!(guest: andra, room: b27)

    visit "/guests/#{andra.id}"
  end


  describe 'When I visit /guests/:id' do
    describe 'Story 1' do
      it 'I see the guest`s name' do
        expect(page).to have_content("Andra's Rooms Stayed In")
        save_and_open_page
      end

      it 'I see guest`s list of rooms, the room`s suite, nightly rate, & name of hotel it belongs to' do
        # expect(page).to have_content("Hotel: Echo Mountain Inn")
        expect(page).to have_content("Suite: Presedential")
        expect(page).to have_content("Rate: 125")

        # expect(page).to have_content("Hotel: Winter Park Hotel")
        expect(page).to have_content("Suite: b27")
        expect(page).to have_content("Rate: 60")
        save_and_open_page
      end
    end
  end
end