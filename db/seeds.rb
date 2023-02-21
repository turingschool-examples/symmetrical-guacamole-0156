# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@hotel_1 = Hotel.create!(name: 'Stanly Hotel', location: 'Estes Park')
@room_401 = @hotel_1.rooms.create!(rate: 50, suite: 'Room 401')
@room_402 = @hotel_1.rooms.create!(rate: 50, suite: 'Room 402')
@guest_1 = Guest.create!(name: 'Jeff', nights: 1)
GuestRoom.create(guest: @guest_1, room: @room_401)