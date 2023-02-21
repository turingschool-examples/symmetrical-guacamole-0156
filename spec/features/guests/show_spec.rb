require 'rails_helper'

RSpec.describe 'show view' do
  let!(:holliday) { Hotel.create!(name: 'Holliday Inn', location: 'Buxton') }
  let!(:harbor) { Hotel.create!(name: 'Portland Harbor', location: 'Portland') }
  let!(:room_1) { harbor.rooms.create!(rate: 180, suite: "Presidential")}
  let!(:room_2) { harbor.rooms.create!(rate: 185, suite: "Vice-Presidential")}
  let!(:room_3) { holliday.rooms.create!(rate: 160, suite: "Honeymoon")}
  let!(:steve) { Guest.create!(name: 'Steve', nights: 3) }
  let!(:dave) { Guest.create!(name: 'Dave', nights: 5) }
  let!(:jim) { Guest.create!(name: 'Jim', nights: 1)}

  before do
    GuestRoom.create!(guest: steve, room: room_1)
    GuestRoom.create!(guest: steve, room: room_2)
    GuestRoom.create!(guest: dave, room: room_2)
  end

  it 'displays list of all the rooms they have stayed in with with all attributes' do
    visit "/guests/#{steve.id}"

    expect(page).to have_content(room_1.suite)
    expect(page).to have_content(room_1.rate)
    expect(page).to have_content(room_1.location)

  end
end