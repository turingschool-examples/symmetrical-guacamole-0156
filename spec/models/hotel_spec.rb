require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'relationships' do
    it {should have_many :rooms}
  end

  # describe 'instance methods' do
    # it "#get_unique_guests" do
    #   hotel1 = Hotel.create!(name: "Holiday Inn", location: "Las Vegas")
    #   hotel2 = Hotel.create!(name: "Mariott", location: "Austin")
    #   hotel3 = Hotel.create!(name: "Condor", location: "Denver")

    #   room1 = hotel1.rooms.create!(rate: 150, suite: "Economy")
    #   room2 = hotel2.rooms.create!(rate: 275, suite: "Double")
    #   room3 = hotel1.rooms.create!(rate: 350, suite: "First Class")
    #   room4 = hotel3.rooms.create!(rate: 575, suite: "Penthouse")

    #   guest1 = room1.guests.create!(name: "Bob", nights: 3)
    #   guest2 = room1.guests.create!(name: "Shane", nights: 10)
    #   guest3 = room1.guests.create!(name: "Isaac", nights: 13)

    #   GuestRoom.create!(guest: guest1, room: room2)
    #   GuestRoom.create!(guest: guest1, room: room3)
    #   GuestRoom.create!(guest: guest2, room: room2)
    #   GuestRoom.create!(guest: guest3, room: room3)

    #   expect(hotel1.get_unique_guests).to eq([guest1, guest2, guest3])
    # end
  # end
end