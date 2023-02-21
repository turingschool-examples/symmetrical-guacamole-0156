# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
hotel = Hotel.create!(name: "Marriott", location: "Denver")

guest = Guest.create!(name: "Brian", nights: 2)

room_1 = Room.create!(rate: 100, suite: "President suite", hotel_id: hotel.id)
room_2 = Room.create!(rate: 150, suite: "Honeymoon Suite", hotel_id: hotel.id)
room_3 = Room.create!(rate: 1000, suite: "Space Suite", hotel_id: hotel.id)

RoomGuest.create!(room: room_1, guest: guest )
RoomGuest.create!(room: room_2, guest: guest )