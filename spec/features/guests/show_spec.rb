require 'rails_helper'

RSpec.describe "Guest Show Page" do
    # Story 1
    # Guest Show

    # As a visitor
    # When I visit a guest's show page
    # I see the guest's name

    # And I see a list of all the rooms they've stayed in
    # including the room's suite, nightly rate, and the name of the hotel that it belongs to.
  let!(:charlize) { Guest.create!(name: "Charlize Theron", nights: 3) }
  let!(:scarlett) { Guest.create!(name: "Scarlett Johansson", nights: 2) }

  before do
    visit "/guests/#{charlize.id}"
  end

  describe "When I visit /guests/:id" do
    it "I should see the guest names" do
      expect(page).to have_content("Name: #{charlize.name}, Nights: #{charlize.nights}")
    end
  end
end
