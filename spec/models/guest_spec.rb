require 'rails_helper'

RSpec.describe Guest, type: :model do
  describe 'relationships' do
    it{should have_many :guest_rooms}
    it{should have_many :rooms}
  end

  describe "class methods" do
    it "#count" do
      guest1 = Guest.create!(name: "Bob", nights: 3)
      guest2 = Guest.create!(name: "Shane", nights: 10)

      expect(Guest.count_guests).to eq(2)

      guest3 = Guest.create!(name: "Isaac", nights: 13)

      expect(Guest.count_guests).to eq(3)
    end
  end
end
