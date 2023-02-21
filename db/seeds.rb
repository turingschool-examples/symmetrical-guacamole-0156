# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
holliday = Hotel.create!(name: 'Holliday Inn', location: 'Buxton')
harbor = Hotel.create!(name: 'Portland Harbor', location: 'Portland') 
room_1 = harbor.rooms.create!(rate: 180, suite: "Presidential")
room_2 = harbor.rooms.create!(rate: 185, suite: "Vice-Presidential")
room_3 = holliday.rooms.create!(rate: 160, suite: "Honeymoon")
room_4 = holliday.rooms.create!(rate: 10, suite: "Broom Closet")
steve = Guest.create!(name: 'Steve', nights: 3)
dave = Guest.create!(name: 'Dave', nights: 5) 
jim = Guest.create!(name: 'Jim', nights: 1)
GuestRoom.create!(guest: steve, room: room_1)
GuestRoom.create!(guest: dave, room: room_1)
GuestRoom.create!(guest: steve, room: room_2)
GuestRoom.create!(guest: dave, room: room_3)
GuestRoom.create!(guest: dave, room: room_4)