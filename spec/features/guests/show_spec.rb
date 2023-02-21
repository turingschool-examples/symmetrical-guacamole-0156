require 'rails_helper'

RSpec.describe 'The Guest Show Page', type: :feature do
  before do 
    @hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
    @hotel_2 = Hotel.create!(name: 'Four Seasons', location: 'Vail')
    @hotel_3 = Hotel.create!(name: 'Ritz', location: 'Denver')
  
    @guest_1 = Guest.create!(name: 'Charlize Theron', nights: 3)
    @guest_2 = Guest.create!(name: 'Elle Majors', nights: 5 )
    @guest_3 = Guest.create!(name: 'Avery Bechtel', nights: 7)
    @guest_4 = Guest.create!(name: 'Tim Cook', nights: 2)
  
    @room_1 = @guest_1.rooms.create!(rate: 125, suite: 'Presidential', hotel_id: @hotel_1.id)
    @room_2 = @guest_2.rooms.create!(rate: 100, suite: 'Premium', hotel_id: @hotel_1.id)
    @room_3 = @guest_3.rooms.create!(rate: 300, suite: 'Executive', hotel_id: @hotel_2.id)
    @room_4 = @guest_4.rooms.create!(rate: 600, suite: 'VIP', hotel_id: @hotel_3.id)
  
    @hotel_rooms1 = HotelRoom.create!(hotel: @hotel_1 , room: @room_1)
    @hotel_rooms2 = HotelRoom.create!(hotel: @hotel_2, room: @room_2)
    @hotel_rooms3 = HotelRoom.create!(hotel: @hotel_3, room: @room_3)
  end

  describe 'user story 1' do
    it 'shows the guests name' do
      visit "/guest/#{guest_1.id}"  

      expect(page).to have_content("Charlize Theron")
      expect(page).to_not have_content("Tim Cook")
    end

    it 'displays a list of all the rooms they stayed in' do
      visit "/guest/#{guest_1.id}"  

      expect(page).to have_content("Presidential")
    end

    it 'includes the rooms suite, nightly rate, and the name of the hotel' do
      visit "/guest/#{guest_1.id}"  

      expect(page).to have_content("Suite: Presidential")
      expect(page).to have_content("Rate: 125")
      expect(page).to have_content("Name: Echo Mountain Inn")
    end
  end

  describe 'user story 2' do
    it 'displays a form to add a room to this guest' do
      visit "/guest/#{guest_1.id}"  

      within("#add-room") do
        expect(page).to have_field("Add Room")
        fill_in "Add Room", with: room_2.id 
        click_button "Submit" 
        # save_and_open
      expect(current_path).to eq("/guest/#{guest_1.id}")
      expect(page).to have_content("#{room_2.id}")
      expect(page).to have_content("Premium")
      end
    end

    it 'displays a form to add a room to this guest' do
      visit "/guest/#{guest_1.id}"  

      within("#add-room") do
        expect(page).to have_field("Add Room")
        fill_in "Add Room", with: room_5.id 
        click_button "Submit" 
      
      expect(current_path).to eq("/guest/#{guest_1.id}")
      expect(page).to_not have_content("#{room_5.id}")
      end
    end
  end
end   