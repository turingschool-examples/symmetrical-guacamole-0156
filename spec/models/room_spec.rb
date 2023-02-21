require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it {should belong_to :hotel}
  end

  describe '#hotel_name' do
    it 'can return the name of the hotel it belongs to' do
      @red_cliffs = Hotel.create!(name: "Red Cliffs Lodge", location: "Moab")
      @river_side = @red_cliffs.rooms.create!(rate: 250, suite: "River Side")

      expect(@river_side.hotel_name).to eq "Red Cliffs Lodge"
    end
  end
end