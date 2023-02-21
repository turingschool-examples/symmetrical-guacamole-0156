require 'rails_helper'

RSpec.describe Guest, type: :model do
  let!(:andra) { Guest.create!(name: "Andra", nights: 4) }
  let!(:james) { Guest.create!(name: "James", nights: 2) }

  describe 'relationships' do
    it { should have_many :guest_rooms }
    it { should have_many(:rooms).through(:guest_rooms) }
  end
end