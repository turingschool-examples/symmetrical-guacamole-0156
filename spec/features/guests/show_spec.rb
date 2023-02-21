require 'rails_helper'

RSpec.describe Guest, type: :feature do 
  let!(:comfy_palace) { Hotel.create!(name: "Comfy Palace", location: "Buena Vista") }

  let!(:room_1) { comfy_palace.rooms.create!(rate: 100, suite: "Presidential") }
  let!(:room_2) { comfy_palace.rooms.create!(rate: 200, suite: "Couples") }

  let!(:hannah) { Guest.create!(name: "Hannah", nights: 3) }

  let!(:hannah_room_1) {GuestRoom.create!(guest_id: hannah.id, room_id: room_1.id) }
  let!(:hannah_room_2) {GuestRoom.create!(guest_id: hannah.id, room_id: room_2.id) }

  describe 'Guest show page' do 
    before (:each) do 
      visit "/guests/#{hannah.id}"
    end

    it 'displays the guests name' do
      expect(page).to have_content("Name: Hannah")
    end

    it 'displays the rooms that the guest has stayed in with the rooms attributes' do
      save_and_open_page

      within "#room_info-#{room_1.id}" do 
        expect(page).to have_content("Suite: #{room_1.suite}\nRate: #{room_1.rate}\nHotel: Comfy Palace")
      end

      within "#room_info-#{room_2.id}" do 
        expect(page).to have_content("Suite: #{room_2.suite}\nRate: #{room_2.rate}\nHotel: Comfy Palace")
      end
    end
  end
end