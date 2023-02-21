require 'rails_helper'

RSpec.describe Room, type: :feature do 
  let!(:comfy_palace) { Hotel.create!(name: "Comfy Palace", location: "Buena Vista") }

  let!(:room_1) { comfy_palace.rooms.create!(rate: 100, suite: "Presidential") }
  let!(:room_2) { comfy_palace.rooms.create!(rate: 200, suite: "Couples") }
  let!(:room_3) { comfy_palace.rooms.create!(rate: 75, suite: "Economy") }

  let!(:hannah) { Guest.create!(name: "Hannah", nights: 3) }
  let!(:denise) { Guest.create!(name: "Denise", nights: 5) }
  let!(:phil) { Guest.create!(name: "Phil", nights: 2) }

  let!(:hannah_room_1) {GuestRoom.create!(guest_id: hannah.id, room_id: room_1.id) }
  let!(:hannah_room_2) {GuestRoom.create!(guest_id: hannah.id, room_id: room_2.id) }

  let!(:denise_room_1) {GuestRoom.create!(guest_id: denise.id, room_id: room_1.id) }
  let!(:denise_room_2) {GuestRoom.create!(guest_id: denise.id, room_id: room_2.id) }
  let!(:denise_room_3) {GuestRoom.create!(guest_id: denise.id, room_id: room_3.id) }

  let!(:phil_room_1) {GuestRoom.create!(guest_id: phil.id, room_id: room_1.id) }
  let!(:phil_room_3) {GuestRoom.create!(guest_id: phil.id, room_id: room_3.id) }

  describe "rooms index page" do 
    before (:each) do 
      visit "/rooms"
    end
    it "displays a list of all of the rooms and their attributes" do

      within "#room_info-#{room_1.id}" do 
        expect(page).to have_content("Suite: #{room_1.suite}\nRate: #{room_1.rate}\nHotel: Comfy Palace")
      end

      within "#room_info-#{room_2.id}" do 
        expect(page).to have_content("Suite: #{room_2.suite}\nRate: #{room_2.rate}\nHotel: Comfy Palace")
      end

      within "#room_info-#{room_3.id}" do 
        expect(page).to have_content("Suite: #{room_3.suite}\nRate: #{room_3.rate}\nHotel: Comfy Palace")
      end

    end
    it "displays all of the guests that have stayed in each room"
  end
end