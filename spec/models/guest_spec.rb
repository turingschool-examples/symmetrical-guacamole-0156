require 'rails_helper'

RSpec.describe Guest, type: :model do
 it { should have_many :rooms }

  describe ".scope" do 
    it '.count_guests' do 
      Guest.create!(name: "Hannah", nights: 3)
      Guest.create!(name: "Phil", nights: 3)
      Guest.create!(name: "Denise", nights: 3)

      expect(Guest.count_guests).to eq(3)
    end
  end
end
