require 'rails_helper'

RSpec.describe 'Show', type: :feature do
  
  let!(:echo) { Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain') }
  let!(:winterpark) { Hotel.create!(name: 'Winter Park Hotel', location: 'Winter Park') }

  let!(:andra) { Guest.create!(name: "Andra", nights: 4) }

  let!(:presedential) { echo.rooms.create!(rate: 125, suite: "Presedential") }
  let!(:b27) { winterpark.rooms.create!(rate: 60, suite: "b27") }
  let!(:e42) { winterpark.rooms.create!(rate: 80, suite: "e42") }


  before do
    GuestRoom.create!(guest: andra, room: presedential)
    GuestRoom.create!(guest: andra, room: b27)

    visit "/guests/#{andra.id}"
  end


  describe 'When I visit /guests/:id' do
    describe 'Story 1' do
      it 'I see the guest`s name' do
        expect(page).to have_content("Andra's Rooms Stayed In")
      end

      it 'I see guest`s list of rooms, the room`s suite, nightly rate, & name of hotel it belongs to' do
        expect(page).to have_content("Hotel: Echo Mountain Inn")
        expect(page).to have_content("Suite: Presedential")
        expect(page).to have_content("Rate: 125")

        expect(page).to have_content("Hotel: Winter Park Hotel")
        expect(page).to have_content("Suite: b27")
        expect(page).to have_content("Rate: 60")
      end
    end

    describe "Story 2" do
      describe 'I see a form to add a room to this guest' do
        describe 'I fill in a field with the id of an existing room and click submit' do
          it 'I am redirected back to the guest`s show page and see the room listed' do

            # save_and_open_page
            expect(page).to have_content("Add a Room to this Guest:")

            expect(page).to have_field(:room_id)
            expect(page).to have_button("Submit")

            fill_in :room_id, with: e42.id
            click_on "Submit"

            expect(current_path).to eq("/guests/#{andra.id}")
            expect(page).to have_content("Hotel: Winter Park Hotel")
            expect(page).to have_content("Suite: e42")
            expect(page).to have_content("Rate: 80")
          end
        end
      end
    end
  end
end