require 'rails_helper'

RSpec.describe Guest, type: :model do
  describe 'relationships' do
    it {should have_many :guest_rooms}
    it {should have_many(:rooms).through(:guest_rooms)}
  end

  it '#name' do
    charlize = Guest.create!(name:"Charlize Theron", nights: 3)
    expect(charlize.name).to eq("Charlize Theron")
  end

  it '#nights' do
    charlize = Guest.create!(name:"Charlize Theron", nights: 3)
    expect(charlize.nights).to eq(3)
  end
end
