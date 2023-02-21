require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'relationships' do
    it {should have_many :rooms}
  end

  it '#name' do
    budapest = Hotel.create!(name: "Grand Budapest", location: 'Turkey')
    expect(budapest.name).to eq("Grand Budapest")
  end

  it '#location' do
    budapest = Hotel.create!(name: "Grand Budapest", location: 'Turkey')
    expect(budapest.location).to eq("Turkey")
  end
end