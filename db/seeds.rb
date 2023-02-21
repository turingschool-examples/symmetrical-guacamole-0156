# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  hotel_1 = Hotel.create!(name: 'The Stanley', location: 'Estes Park')
  room_1 = hotel_1.rooms.create!(rate: 50, suite: 'Suite 1')
  room_2 = hotel_1.rooms.create!(rate: 60, suite: 'Suite 2')
  john = Guest.create!(name: 'John Smith', nights: 2)

  GuestRoom.create!(guest: john, room: room_1)
  GuestRoom.create!(guest: john, room: room_2)
  
  room_3 = hotel_1.rooms.create!(rate: 55, suite: 'Suite 3')
