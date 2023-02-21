require 'rails_helper'

RSpec.describe Guest, type: :model do
  describe 'relationships' do
    it {should have_many :guest_rooms}
    it {should have_many(:rooms).through(:guest_rooms)}
  end

  describe 'class methods' do
    it "can count the total number of guests" do
      matt = Guest.create!(name: 'Matt', nights: 5)
      keith = Guest.create!(name: 'Keith', nights: 2)
      stephanie = Guest.create!(name: 'Stephanie', nights: 4)

      expect(Guest.count_guests).to eq(3)

      sunita = Guest.create!(name: 'Sunita', nights: 4)

      expect(Guest.count_guests).to eq(4)
    end
  end
end