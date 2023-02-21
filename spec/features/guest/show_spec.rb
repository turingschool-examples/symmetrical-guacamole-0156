require "rails_helper"

RSpec.describe "Guest#Show" do
  before(:each) do
    @hotel = create(:hotel)
    
    @room_1 = create(:room, hotel: @hotel)
    @room_2 = create(:room, hotel: @hotel)
    @room_3 = create(:room, hotel: @hotel)

    @guest_1 = create(:guest)
    @guest_2 = create(:guest)
    @guest_3 = create(:guest)
    @guest_4 = create(:guest)
    @guest_5 = create(:guest)
    @guest_6 = create(:guest)

    @room_1.guests << @guest_1
    @room_1.guests << @guest_2
    @room_2.guests << @guest_3
    @room_3.guests << @guest_4
    @room_3.guests << @guest_5
    @room_3.guests << @guest_6
  end

  it "shows the guests NAME" do
    visit "/guests/#{@guest_1.id}"
    expect(page).to have_content(@guest_1.name)

    visit "/guests/#{@guest_2.id}"
    expect(page).to have_content(@guest_2.name)
    expect(page).to_not have_content(@guest_1.name)
  end

  xit "shows a list of all the ROOMS they've stayed in" do
    
  end

  xit "includes the rooms SUITE, nightly RATE, and HOTEL NAME it belongs to" do
    
  end
end