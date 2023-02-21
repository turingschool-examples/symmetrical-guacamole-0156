require 'rails_helper'

RSpec.describe 'The Room Index Page', type: :feature do
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

  describe 'user story 3' do
    it 'displays a list of all rooms' do
      visit "/rooms"  

      expect(page).to have_content("Presidential")
      expect(page).to_not have_content("Premium")
    end

    it 'includes the rooms suite, nightly rate, and the name of the hotel' do
      visit "/rooms"  

      expect(page).to have_content("Suite: Presidential")
      expect(page).to have_content("Rate: 125")
      expect(page).to have_content("Suite:Premium")
      expect(page).to have_content("Rate: 100")
      expect(page).to have_content("Name: Echo Mountain Inn")
    end

    xit 'includes number of guests that have stayed in that room' do
      visit "/rooms"  

      expect(page).to have_content("Number of Guest")
    end
  end