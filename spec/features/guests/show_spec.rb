require 'rails_helper'

RSpec.describe 'When a user visit a guests show page', type: :feature do
	before do 
		@guest1 = Guest.create!(name: 'Brad Dunlap', nights: 5)
		@guest2 = Guest.create!(name: 'Adrian Fierro', nights: 4)
		@guest3 = Guest.create!(name: 'Aaron McKendry', nights: 3)
		@hotel = Hotel.create!(name: 'Sleepy Inn', location: "Pittsburgh")
		@hotel2 = Hotel.create!(name: 'Hells Hotel', location: "Detroit")
		@pres = @hotel.rooms.create!(rate: 200, suite: "Presidential")
		@pent = @hotel.rooms.create!(rate: 250, suite: "Penthouse")
		@suite = @hotel.rooms.create!(rate: 250, suite: "Suite")
		@lava = @hotel2.rooms.create!(rate: 666, suite: "Lava Pit")
		RoomGuest.create!(guest: @guest1, room: @pres)
		RoomGuest.create!(guest: @guest1, room: @pent)
		RoomGuest.create!(guest: @guest2, room: @pent)
		RoomGuest.create!(guest: @guest2, room: @suite)
		RoomGuest.create!(guest: @guest3, room: @suite)
		RoomGuest.create!(guest: @guest3, room: @lava)
	end
	
  scenario 'see the guests name' do
		visit "/guests/#{@guest1.id}"
    expect(page).to have_content("Name: Brad Dunlap")
    expect(page).to_not have_content("Name: Adrian Fierro")
		visit "/guests/#{@guest2.id}"
    expect(page).to have_content("Name: Adrian Fierro")
    expect(page).to_not have_content("Name: Brad Dunlap")
  end

	scenario 'see a list of all the rooms they have stayed in with room attributes' do
		visit "/guests/#{@guest1.id}"
		within 'div#rooms_stayed' do
			expect(page).to have_content("Presidential ($200 at the Sleepy Inn)")
			expect(page).to have_content("Penthouse ($250 at the Sleepy Inn)")
		end

		visit "/guests/#{@guest3.id}"
		within 'div#rooms_stayed' do
			expect(page).to have_content("Suite ($250 at the Sleepy Inn)")
			expect(page).to have_content("Lava Pit ($666 at the Hells Hotel)")
		end
	end

	scenario 'see a form to add a room to this guest' do
		visit "/guests/#{@guest1.id}"		
		expect(page).to have_selector('div#add_rooms')
		expect(page).to have_field('room_id')
		expect(page).to have_button('Submit')	
	end

	scenario 'I fill in a field with the id of an existing room
	And I click submit, I am redirected to the guest show page and I see the room now listed under this guests rooms' do
		visit "/guests/#{@guest1.id}"
		fill_in 'room_id', with: "#{@suite.id}"
		click_button 'Submit'

		expect(current_path).to eq("/guests/#{@guest1.id}")

		within 'div#rooms_stayed' do
			expect(page).to have_content("Suite ($250 at the Sleepy Inn)")
		end
	end
end