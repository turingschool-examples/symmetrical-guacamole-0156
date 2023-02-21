require 'rails_helper'

RSpec.describe 'Hotels show feature spec' do
before(:each) do 
  @hotel_1 = Hotel.create!(name: "Losodeli", location: "Rinconada")
  @hotel_2 = Hotel.create!(name: "Casa Flow", location: "Zicatela")

  @room_san_jose = @hotel_1.rooms.create!(rate: 80, suite: "Presidential")
  @room_oaxaca = @hotel_1.rooms.create!(rate: 100, suite: "Twin")
  @room_jocotopec = @hotel_1.rooms.create!(rate: 50, suite: "Pauper")
  @room_da_flow = @hotel_2.rooms.create!(rate:300, suite: "Beachside")

  @guest_hady = Guest.create!(name: "Hady", nights: 12)
  @guest_malena = Guest.create!(name: "Malena", nights: 6)
  @guest_sebastian = Guest.create!(name: "Sebastian", nights: 8)
  @guest_axel = Guest.create!(name: "Axel", nights: 3)

  GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_oaxaca.id)
  GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_jocotopec.id)
  GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_da_flow.id)

  GuestRoom.create!(guest_id: @guest_malena.id, room_id: @room_jocotopec.id)
  GuestRoom.create!(guest_id: @guest_malena.id, room_id: @room_da_flow.id)

  GuestRoom.create!(guest_id: @guest_sebastian.id, room_id: @room_da_flow.id)
  GuestRoom.create!(guest_id: @guest_sebastian.id, room_id: @room_san_jose.id)

  GuestRoom.create!(guest_id: @guest_axel.id, room_id: @room_da_flow.id)


end 

  describe "as a visitor" do
    describe "when visit the hotel show page" do 
      it "displays a unique list of all the guests at the hotel" do

        visit "/hotels/#{@hotel_1.id}"

        within("div#unique_list_of_guests") do 
          expect(page).to have_content(@guest_hady.name)
          expect(page).to have_content(@guest_malena.name)
          expect(page).to have_content(@guest_sebastian.name)
        end
      end 
    end 
  end 
end 