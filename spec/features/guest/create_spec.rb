require 'rails_helper'

RSpec.describe 'Add Room to Guest#Show' do
  before(:each) do
    @hotel = create(:hotel)
    
    @room_1 = create(:room, hotel: @hotel)
    @room_2 = create(:room, hotel: @hotel)

    @guest_1 = create(:guest)

    @room_1.guests << @guest_1
    @room_2.guests << @guest_1

    @room_3 = create(:room, hotel: @hotel)

    visit "/guests/#{@guest_1.id}"
  end

  describe "new room" do
    xit "renders a new form" do
      expect(page).to have_content('Add Room')
      expect(find('form')).to have_content('Hotel ID')
    end

    xit "creates a new guest" do
      fill_in 'Hotel ID', with: @room_3.id
      click_button 'Submit'
      expect(page).to have_current_path("/guests/#{@guest_1.id}")
      expect(page).to have_content("Suite Name: #{@room_3.suite}")
    end
  end
end