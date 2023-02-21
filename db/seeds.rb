# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@hotel_1 = Hotel.create!(name: "Losodeli", location: "Rinconada")
@hotel_2 = Hotel.create!(name: "Casa Flow", location: "Zicatela")

@room_san_jose = @hotel_1.rooms.create!(rate: 80, suite: "Presidential")
@room_oaxaca = @hotel_1.rooms.create!(rate: 100, suite: "Twin")
@room_jocotopec = @hotel_1.rooms.create!(rate: 50, suite: "Pauper")
@room_da_flow = @hotel_2.rooms.create!(rate:300, suite: "Beachside")

@guest_hady = Guest.create!(name: "Hady", nights: 12)
@guest_malena = Guest.create!(name: "Malena", nights: 6)
@guest_sebastian = Guest.create!(name: "Sebastian", nights: 8)

GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_oaxaca.id)
GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_jocotopec.id)
GuestRoom.create!(guest_id: @guest_hady.id, room_id: @room_da_flow.id)

GuestRoom.create!(guest_id: @guest_malena.id, room_id: @room_jocotopec.id)
GuestRoom.create!(guest_id: @guest_malena.id, room_id: @room_da_flow.id)

GuestRoom.create!(guest_id: @guest_sebastian.id, room_id: @room_da_flow.id)
GuestRoom.create!(guest_id: @guest_sebastian.id, room_id: @room_san_jose.id)