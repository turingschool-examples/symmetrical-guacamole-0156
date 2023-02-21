require 'rails_helper'

RSpec.describe 'Rooms index feature spec' do
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

  GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_oaxaca.id)
  GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_jocotopec.id)
  GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_da_flow.id)

  GuestRoom.create!(guest_id: @guest_malena.id, room_id: @room_jocotopec.id)
  GuestRoom.create!(guest_id: @guest_malena.id, room_id: @room_da_flow.id)

  GuestRoom.create!(guest_id: @guest_sebastian.id, room_id: @room_da_flow.id)
  GuestRoom.create!(guest_id: @guest_sebastian.id, room_id: @room_san_jose.id)

end 

  describe "as a visitor" do
    describe "when visit the rooms index page" do 
      it "displays a list of all the rooms including suite, nightly rate, name of hotel it belongs to, and number of guests in that room" do 

        visit "/rooms"

        expect(page).to have_content("#{@room_jocotopec.suite} is located within the hotel #{@room_jocotopec.hotel.name}. It has a nightly rate of #{@room_jocotopec.rate} per night and to date, has housed 2 guests.")

        expect(page).to have_content("#{@room_san_jose.suite} is located within the hotel #{@room_san_jose.hotel.name}. It has a nightly rate of #{@room_san_jose.rate} per night and to date, has housed 1 guests.")

        expect(page).to have_content("#{@room_oaxaca.suite} is located within the hotel #{@room_oaxaca.hotel.name}. It has a nightly rate of #{@room_oaxaca.rate} per night and to date, has housed 1 guests.")

        expect(page).to have_content("#{@room_da_flow.suite} is located within the hotel #{@room_da_flow.hotel.name}. It has a nightly rate of #{@room_da_flow.rate} per night and to date, has housed 3 guests.")

      end
    end
  end 
end 