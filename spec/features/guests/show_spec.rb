require 'rails_helper'

RSpec.describe 'Guest show feature spec' do
before(:each) do 
  @hotel_1 = Hotel.create!(name: "Losodeli", location: "Rinconada")
  @hotel_2 = Hotel.create!(name: "Casa Flow", location: "Zicatela")

  @room_san_jose = @hotel_1.rooms.create!(rate: 80, suite: "Presidential")
  @room_oaxaca = @hotel_1.rooms.create!(rate: 100, suite: "Twin")
  @room_jocotopec = @hotel_1.rooms.create!(rate: 50, suite: "Pauper")

  @guest_hady = Guest.create!(name: "Hady", nights: 12)
  @guest_malena = Guest.create!(name: "Malena", nights: 6)

  GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_oaxaca.id)
  GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_jocotopec.id)



end 

  describe "as a visitor" do
    describe "when visit a guest show page" do 
      it "displays the guest's name and all the rooms they have stayed in" do 

        visit "/guests/#{@guest_hady.id}"

        expect(page).to have_content("Guest Name: #{@guest_hady.name}")

        within("div#rooms_stayed_in") do 
          expect(page).to have_content("#{@guest_hady.name} stayed in the #{@room_oaxaca.suite} at #{@room_oaxaca.hotel.name} for #{@room_oaxaca.rate} per night.")

          expect(page).to have_content("#{@guest_hady.name} stayed in the #{@room_jocotopec.suite} at #{@room_jocotopec.hotel.name} for #{@room_jocotopec.rate} per night.")

        end

      end
    end
  end
end 