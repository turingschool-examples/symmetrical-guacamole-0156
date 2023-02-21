require 'rails_helper'

describe "When I visit a guest's show page", type: :feature do
  before(:each) do
    @hilton = Hotel.create!(name: "Hilton", location: "Hawaii")
    @double_tree = Hotel.create!(name: "DoubleTree", location: "Los Angeles")
    
    @jasmine = Guest.create!(name: "Jasmine", nights: 2)
    @ivan = Guest.create!(name: "Ivan", nights: 2)

    @penthouse = @hilton.rooms.create!(rate: 350, suite: "Penthouse")
    @king = @hilton.rooms.create!(rate: 175, suite: "King")
    @double = @double_tree.rooms.create!(rate: 190, suite: "Double")

    GuestRoom.create!(guest: @jasmine, room: @penthouse)
    GuestRoom.create!(guest: @jasmine, room: @king)
  end

  describe 'User Story 1' do
    it "displays the guest's name" do
      visit "/guests/#{@jasmine.id}"

      expect(page).to have_content(@jasmine.name)
      expect(page).to_not have_content(@ivan.name)
    end

    it "lists the all the rooms the guest has stayed in, including the suite, nightly rate, and the name of the hotel" do
      visit "/guests/#{@jasmine.id}"

      within "##{@penthouse.suite}" do
        expect(page).to have_content("Suite: #{@penthouse.suite}")
        expect(page).to have_content("Nightly Rate: $#{@penthouse.rate}")
        expect(page).to have_content("Hotel: #{@hilton.name}")
      end

      within "##{@king.suite}" do
        expect(page).to have_content("Suite: #{@king.suite}")
        expect(page).to have_content("Nightly Rate: $#{@king.rate}")
        expect(page).to have_content("Hotel: #{@hilton.name}")
      end

      expect(page).to_not have_content(@double.suite)
    end
  end

  describe 'User Story 2' do
    it "has a form to add a room to the guest using the room ID" do
      visit "/guests/#{@jasmine.id}"

      within "#add_a_room" do
        expect(page).to have_field(:room_id)
        expect(page).to have_button("Submit")
      end
    end

    it "redirects to the guest show page after filling in the field with an exisitng room ID and clicking submit" do
      visit "/guests/#{@jasmine.id}"

      within "#add_a_room" do
        fill_in :room_id, with: @double.id
        click_button "Submit"
      end

      expect(current_path).to eq("/guests/#{@jasmine.id}")
    end

    it "displays the added room after the form is submitted" do
      visit "/guests/#{@jasmine.id}"

      within "#add_a_room" do
        fill_in :room_id, with: @double.id
        click_button "Submit"
      end

      within "##{@double.suite}" do
        expect(page).to have_content("Suite: #{@double.suite}")
        expect(page).to have_content("Nightly Rate: $#{@double.rate}")
        expect(page).to have_content("Hotel: #{@double_tree.name}")
      end
    end
  end
end