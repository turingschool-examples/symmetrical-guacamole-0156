require 'rails_helper'

describe "'When I visit a hotel's show page", type: :feature do
  before(:each) do
    @hilton = Hotel.create!(name: "Hilton", location: "Hawaii")
    @double_tree = Hotel.create!(name: "DoubleTree", location: "Los Angeles")
    
    @jasmine = Guest.create!(name: "Jasmine", nights: 2)
    @ivan = Guest.create!(name: "Ivan", nights: 2)
    @hailey = Guest.create!(name: "Hailey", nights: 1)
    @rostam = Guest.create!(name: "Rostam", nights: 4)

    @penthouse = @hilton.rooms.create!(rate: 350, suite: "Penthouse")
    @king = @hilton.rooms.create!(rate: 175, suite: "King")
    @double = @double_tree.rooms.create!(rate: 190, suite: "Double")

    GuestRoom.create!(guest: @jasmine, room: @penthouse)
    GuestRoom.create!(guest: @jasmine, room: @king)
    GuestRoom.create!(guest: @ivan, room: @king)
    GuestRoom.create!(guest: @ivan, room: @double)
    GuestRoom.create!(guest: @hailey, room: @king)
    GuestRoom.create!(guest: @hailey, room: @double)
    GuestRoom.create!(guest: @rostam, room: @double)
  end

  describe 'Extension' do
    it "displays a unique list of all guests that have stayed at that hotel" do
      visit "/hotels/#{@hilton.id}"
save_and_open_page
      within "#guests" do
        expect(page).to have_content("Name: #{@hailey.name}, Nights: #{@hailey.nights}")
        expect(page).to have_content("Name: #{@ivan.name}, Nights: #{@ivan.nights}")
        expect(page).to have_content("Name: #{@jasmine.name}, Nights: #{@jasmine.nights}")
        expect(page).to_not have_content(@rostam.name)
      end
    end
  end
end