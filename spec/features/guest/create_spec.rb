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
    it "renders a new form" do
      expect(page).to have_content('Add Room')
      expect(find('form')).to have_content('Room id')
    end

    xit "adds an existing room to this guests show page" do
      visit "/guests/#{@guest_1.id}"

      fill_in 'Room', with: "#{@room_3.id}"
      click_button 'Submit'
      expect(page).to have_current_path("/guests/#{@guest_1.id}")
      expect(page).to have_content("Suite Name: #{@room_3.suite}")
    end
  end
end