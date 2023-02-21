require 'rails_helper'

RSpec.describe Guest, type: :model do
  describe 'relationships' do
    it { should have_many :room_guests }
    it { should have_many :rooms }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :nights }
    it { should validate_numericality_of :nights }
  end
  
  describe '::Class Methods' do
    describe '::total_guests' do
      it "returns the total number of guests" do
        Guest.create!(name: "Adam", nights: 2)

        expect(Guest.total_guests).to eq(1)
        
        Guest.create!(name: "Brie", nights: 5)

        expect(Guest.total_guests).to eq(2)
      end
    end
  end
end
