require 'rails_helper'

RSpec.describe "Guest Show Page", type: :feature do

  before do
    @hotel_1 = Hotel.create(name: "La Quinta", location: "Denver")

    @executive = @hotel_1.rooms.create!(rate: 400, suite: "Executive")
    @terrace = @hotel_1.rooms.create!(rate: 500, suite: "Terrace")
  end
  
  let!(:antonio_rm1) { @executive.guests.create!(name: "Antonio", nights: 6) }
  let!(:antonio_rm2) { @terrace.guests.create!(name: "Antonio", nights: 6) }

  describe 'As a visitor,' do
    context "When I visit a guest's show page," do
      it "I see the guest's name," do
        visit "/guests/#{antonio_rm1.id}"
        require 'pry'; binding.pry
        expect(page).to have_content(@guest_1.name)
        expect(page).to have_content(ronin.department)
        expect(page).to have_content("#{ronin.name}'s Tickets")
      end
    end
  end
end