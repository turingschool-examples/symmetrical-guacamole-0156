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
      it 'I see the guest`s name & list of all the rooms they`ve stayed in' do
        expect(page).to have_content("Andra")
        expect(page).to have_content("Presedential")
        expect(page).to have_content("b27")
      end

      it 'I see room`s suite, nightly rate, & name of hotel it belongs to'
    end
  end
end