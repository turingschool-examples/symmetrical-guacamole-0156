# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hotel_1 = Hotel.create(name: 'Marriott', location: 'Vail Resort')
hotel_2 = Hotel.create(name: 'Days Inn', location: 'Portland Airport')
hotel_3 = Hotel.create(name: 'Holiday Inn', location: 'Los Angeles')

room_5 = hotel_1.rooms.create(rate: 110, suite: "Double")
room_3 = hotel_1.rooms.create(rate: 140, suite: "Presidential")
room_2 = hotel_2.rooms.create(rate: 125, suite: "Twin")
room_4 = hotel_2.rooms.create(rate: 80, suite: "Studio")
room_1 = hotel_3.rooms.create(rate: 100, suite: "Deluxe")

guest_1 = Guest.create(name: "Charlize Theron", nights: 2)
guest_2 = Guest.create(name: "John Doe", nights: 1)
guest_3 = Guest.create(name: "Mary Jane", nights: 5)


RoomGuest.create!(guest: guest_1, room: room_1)
RoomGuest.create!(guest: guest_1, room: room_5)
RoomGuest.create!(guest: guest_1, room: room_3)
RoomGuest.create!(guest: guest_2, room: room_1)
RoomGuest.create!(guest: guest_2, room: room_2)